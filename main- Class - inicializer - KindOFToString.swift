class namedShape: CustomStringConvertible {
  var numberOfSides = 0
  var name = " "
  
  var description: String {
    return  "Esto es un \(name) y tiene \(numberOfSides)"
  }

  init(nameOfShape name: String,sides numberOfSides: Int){
    self.numberOfSides = numberOfSides
    self.name = name 
  }

  func simpleDescription() -> String {
    return "Is a shape with \(numberOfSides) "
  }

  //Add a constant property with let, and add another method that takes an argument. 
  func changeName(nameOfShape name:String){
    self.name = name
  }

}

let triangule = namedShape(nameOfShape: "triangule",sides: 3)

print(String(describing: triangule))