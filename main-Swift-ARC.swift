class Person {
    var name: String
    weak var apartment: Apartment?
    
    init(name: String){
        self.name = name
        print("Initializing")
    }

    deinit{
        print("De-Initializing")
    }
}

class Apartment {
    var unit : String
    weak var tenant : Person?

    init(unitName: String){
        self.unit = unitName
    }

    deinit{
      print("la gente esta muy loca")
    }
}



var person: Person? = Person(name: "Joel")
var unit35 : Apartment? = Apartment(unitName: "unit35")

unit35!.tenant = person!
person!.apartment = unit35!

unit35 = nil
person = nil


class Person {
    var name: String
    weak var apartment: Apartment?
    
    init(name: String){
        self.name = name
        print("Initializing")
    }

    deinit{
        print("De-Initializing")
    }
}

class Apartment {
    var unit : String
    weak var tenant : Person?

    init(unitName: String){
        self.unit = unitName
    }

    deinit{
      print("la gente esta muy loca")
    }
}

var person: Person? = Person(name: "Joel")
var unit35 : Apartment? = Apartment(unitName: "unit35")

unit35!.tenant = person!
person!.apartment = unit35!

unit35 = nil
person = nil


    
