class NamedShape: CustomStringConvertible {
  var numberOfSides: Int 
  var name: String 

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

class Square: NamedShape{
  var sideLength: Double
  
  override var description : String {
    return "Esto es un \(self.name) y tiene \(self.numberOfSides) y tiene un ancho de lado de: \(self.sideLength)"
  }

  init(sideLength length:Double,nameOfShape shape:String,sidesOfShape sides: Int) {
    self.sideLength = length
    super.init(nameOfShape:shape,sides: 4)
  }

  func area() -> Double{
    let result = self.sideLength * self.sideLength
    return result
  }

  override func simpleDescription() -> String {
    return "is a shape with \(self.numberOfSides) lados y  \(self.sideLength) ancho de lado"
  }
}

class Circule: NamedShape{
  var radius: Double

  init(){

  }
  
}

let triangule = NamedShape(nameOfShape: "triangule",sides: 3)
let square = Square(sideLength: 4.5, nameOfShape: "Square", sidesOfShape: 4)

print(String(describing: square))
print(String(describing: triangule))
print(square.simpleDescription())