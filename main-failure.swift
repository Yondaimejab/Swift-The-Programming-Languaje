class Product {
    let name : String

    init?(name: String){
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem : Product {
    var quantity : Int 

    init?(name: String,quantity: Int){
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let item = CartItem(name: "Socks",quantity: 2) {
    print("We got an item name \(item.name) and the quantity is \(item.quantity)")
}

if let shirts = CartItem(name: "Shirts", quantity: 0){
    print("it worked")
}else{
    print("Unable to print cause initialization fail")
}

