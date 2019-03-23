class Person {
    var name: String

    init(personName name:String){
        self.name = name
    }

    func change(name: String) -> Bool{
        if name.isEmpty {
            return false
        }
        self.name = name
        return true
    }
}

func printSome(condition: (String) -> (Bool)){
    let name = "joel"
    if condition(name){
        print("El nombre se cambio a \(name)")
    }else {
        print("No ha habido ningun cambio")
    }
}

var joel = Person(personName: "Enmanuel")
printSome(condition: joel.change)



