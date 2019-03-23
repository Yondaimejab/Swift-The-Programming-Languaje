class List<Int> {
    var items: [Int]
    
    init(){
      items = [Int]()
    }

    var numbersInRow: Int  {
        get { 
          var temp = 0
          for (index,_) in items.enumerated() { 
            if let temp2 = (items[index + 1] - 1)  {
                if items[index] == temp2 {
                    temp += 1
                }
            }
        }
        return temp
      }
    }

    init(listOfItems items: [Int]){
      self.items = items
    }


}

print("Welcome to the program that reads your sentences and calculates which is the array with more numbers in a row")

var sentence = "1236789123456789"
var numbers = [Int]()

for letter in sentence.characters {
  numbers.append(Int(String(letter)))
}

var lista = List(items: numbers)

