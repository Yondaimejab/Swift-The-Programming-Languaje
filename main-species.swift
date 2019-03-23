//Failure initializers
struct Animal {
    let species: String

    init?(_ species: String){
        if species.isEmpty { return nil}
        self.species = species
    }

}

let someCreature = Animal("Giraffe")
if let giraffe = someCreature {
    print("an animal was initialized with a  specie of \(giraffe.species)")
}


enum TemperatureUnit {
    case kelvin, celsius,farenheit

    init?(simbol: Character){
        switch simbol {
        case "K":
            self = .celsius
        case "F":
            self = .farenheit
        case "C":
            self = .celsius
        default:
            return nil
        }
    }
}

let farenheitUnit = TemperatureUnit(simbol: "F")
if farenheitUnit != nil {
    print("this Temperature Unit was initialized succesfully")
}

let someUnit = TemperatureUnit(simbol: "A")
if someUnit == nil {
  print("Cant initialize TemperatureUnit because it doesnt exists")
}


enum TemperatureUnit2 : Character {
    case kelvin = "K"
    case celsius = "C"
    case farenheit = "F"

    init?(_ rawValue: Character) {
        switch rawValue {
        case "K" :
            self = .kelvin
        case "F":
            self = .farenheit
        case "C":
            self = .celsius
        default:
            return nil
        }
    }
}

let farenheitUnit2 = TemperatureUnit2("s")
if farenheitUnit2 != nil {
    print("this Temperature Unit was initialized succesfully")
}else{
   print("Cant initialize TemperatureUnit because it doesnt exists")
}
