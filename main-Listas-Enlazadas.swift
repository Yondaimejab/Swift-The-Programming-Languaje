class newClass {
    var value: Int
    var nextObject: newClass?

    init(value: Int){
        self.value = value
    }

    init(value: Int,nextObject: newClass?){
        self.value = value
        self.nextObject = nextObject!
    }
}

var classThree = newClass(value: 30)
var classTwo = newClass(value: 20,nextObject: classThree)
var classOne = newClass(value: 10,nextObject:classTwo)

if let secundObject = classOne.nextObject {
  if let thirdObject = secundObject.nextObject {
    print(thirdObject.value)
    print(secundObject.value)
    print(classOne.value)
  }
} 