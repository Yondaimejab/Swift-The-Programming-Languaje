class NamedShape: CustomStringConvertible {
    var numberOfSides: Int 
    var name: String 

    var description: String {
        return  "Esto es un \(name) y tiene \(numberOfSides)"
    }

    init(nameOfShape name:String){
        self.name = name
        self.numberOfSides = 0
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

  init(sideLength length:Double,nameOfShape shape:String) {
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
    override var description: String {
        return "La figura es un \(self.name), no tiene lados,tiene un radio de  \(self.radius) y una area de " + "\( area() )"
    }
    
    init(radius: Double,FigureName name: String){
        self.radius = radius
        super.init(nameOfShape: name,sides: 0)
    }

    func area() -> Double{
        return (radius*3.1416)*(radius*3.1416)
    }

    override func simpleDescription() -> String{
        return "La figura es \(self.name) y no tiene lados"
    }
  
}

class EquilateralTriangle: NamedShape{
    var sideLength: Double
    var perimiter: Double{
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    override var description : String {
        return "this is an \(self.name) that has \(self.numberOfSides) and are of a length : \(self.sideLength)"
    }

    init(sideLength length: Double,nameOfShape name: String){
        self.sideLength = length
        super.init(nameOfShape: name)
        self.numberOfSides = 3
    }

    override func simpleDescription() -> String{
        return "an equilateral triangle with sides length of: \(self.sideLength)"
    }
}

class TriangleAndSquare{
    var triangle: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String){
        self.square = Square(sideLength: size,nameOfShape: name)
        self.triangle = EquilateralTriangle(sideLength: size,nameOfShape: name)
        print(String(describing: square))
        print(String(describing: triangle))       
    }   
}

let triangleEquilateral = EquilateralTriangle(sideLength: 6.2,nameOfShape: "triangule")
let triangule = NamedShape(nameOfShape: "triangule",sides: 3)
let square = Square(sideLength: 4.5, nameOfShape: "Square")
let circule = Circule(radius: 10,FigureName: "Circulo");
let newfigure = TriangleAndSquare(size: 4.4, name: "TrianguloCuadrado")
print(String(describing: triangleEquilateral))
print(String(describing: circule))
print(String(describing: square))
print(String(describing: triangule))
print(square.simpleDescription())





