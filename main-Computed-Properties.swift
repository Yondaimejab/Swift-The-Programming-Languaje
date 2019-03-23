class Person: CustomStringConvertible {
    var name: String
    var lastName: String
    var description: String{
        get {
            return "My name is \(name) and lastname is \(lastName)"
        }
    }

    init(name: String, lastName: String){
        self.name = name
        self.lastName = lastName
    }


}

class Emploee: Person {
    var workHours: Int
    private(set) var charge: String
    var paymentPerHour: Double
    
    var salary: Double {
        get {
            return Double(workHours) * paymentPerHour
        }
    }

    init(name: String,lastName: String, workHours hours: Int,charge: String, paymentPerHour: Double) {                        self.workHours = hours
        self.charge = charge
        self.paymentPerHour = paymentPerHour
        super.init(name: name,lastName: lastName)

    }

    override var description : String {
        get {
            return "My name is \(self.name) and my lastname \(self.lastName) " +
            " i work for oriontek as a \(charge) i worked \(workHours) this week and i get paid \(paymentPerHour)  per hour so is good"
        }
    } 

}

var emploee = Emploee(name: "Joel",lastName: "Alcantara",workHours: 160,charge: "Developer", paymentPerHour: 200.0)

print(String(describing: emploee))
print("")
print("\(emploee)")
print("")
print("\(emploee.salary)")
emploee.workHours = 200
print("")
print("\(emploee.salary)")