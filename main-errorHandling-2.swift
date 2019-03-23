enum VendingMachineError:  Error, CustomStringConvertible {
        case invalidSelection 
        case insuficientFunds 
        case outOfStock 

        var description: String  {
          get {
              switch(self){
              case .invalidSelection: 
                  return "No such item in VendingMachine"
              case .insuficientFunds:
                  return "Amount of coins not enough"
              case .outOfStock: 
                  return "no items left in stock"
            }
          }
        }
}

struct PurshasedSnack {
    let name: String
    
    init(name: String, machine: VendingMachine) throws {
        try machine.vend(itemName: name)
        self.name = name
    }
}

struct Item {
    var price: Int
    var count: Int

    init(price: Int,count: Int){
        self.price = price
        self.count = count
    }
}

class VendingMachine {
    var inventory = [
        "Candy bar" : Item(price: 12,count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
        "Pitzza" : Item(price: 5, count: 0)
    ]

    var coinsDeposited = 0

    func vend(itemName name: String) throws {
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }    

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else{
            throw VendingMachineError.insuficientFunds
            //(coinsNeeded: item.price - coinsDeposited)       
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

var vendingMachine = VendingMachine()
var itemName = "Pizza"
do{
   try vendingMachine.vend(itemName: itemName)
}catch VendingMachineError.invalidSelection {
  print(VendingMachineError.invalidSelection.description)
}catch VendingMachineError.insuficientFunds {
  print(VendingMachineError.insuficientFunds.description)
}catch{
  print(VendingMachineError.outOfStock.description)
}

let favoriteSnack = [
    "Alice" : "Chips",
    "Bob": "Licore",
    "Eve": "Pretzels"
]


func buyFavoriteSnack(person: String, machine: VendingMachine) throws {
    let snackName = favoriteSnack[person] ?? "Candy bar"
     try machine.vend(itemName: snackName)
   
}

 do{
    try buyFavoriteSnack(person: "Bob",machine: vendingMachine)
  }catch VendingMachineError.invalidSelection {
    print(VendingMachineError.invalidSelection.description)
  }catch VendingMachineError.insuficientFunds {
    print(VendingMachineError.insuficientFunds.description)
  }catch{
       print(VendingMachineError.outOfStock.description)
  }

