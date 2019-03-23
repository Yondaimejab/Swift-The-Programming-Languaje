protocol ExampleProtocol{
    var simpleDescription : String {get}

    mutating func adjust()
}

struct SimpleStructure: ExampleProtocol{
    var simpleDescription: String = "A simple estructure" 

    mutating func adjust(){
        simpleDescription += " (Adjusted)"
    }

}

var estructure = SimpleStructure()
print(estructure.simpleDescription)
estructure.adjust()
let estructureDescription = estructure.simpleDescription
print(estructureDescription)


enum PlayerPosition: Int, ExampleProtocol {
    case Base = 1
    case Guard

    var simpleDescription: String {
        get{
            return getDescription()
        }
    }

    mutating func adjust(){
        switch self {
            case .Base:
                self = PlayerPosition.Guard
            case .Guard:
                self = PlayerPosition.Base
        }
    }

    func getDescription() -> String {
        switch self {
        case .Base:
            return "The player position is base, drives de ball"
        case .Guard:
            return "The player position is guard, helps the base position"
      }
    }
}

var playerPosition = PlayerPosition.Base
var basePlayerPositionDescription = playerPosition.simpleDescription;
print(basePlayerPositionDescription)
playerPosition.adjust()
print(playerPosition.simpleDescription)