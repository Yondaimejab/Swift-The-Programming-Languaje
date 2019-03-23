class Vehicule {
    var numberOfWheels = 0
    var description : String {
        return "this vehicule has \(numberOfWheels) wheels"
    }
}

var vehicule = Vehicule()
print(vehicule.description)

class Bicicle : Vehicule {
    override init(){
        super.init()
        numberOfWheels = 2
    }
}

var bicicle = Bicicle()

print(bicicle.description)

class Food {
    var name : String 

    init(name: String){
        self.name = name
    }

    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

let misteryFood = Food()

print(misteryFood.name)

class RecipeIngredient : Food {
    var quantity : Int

    init(name: String,quantity : Int){
        self.quantity = quantity
        super.init(name: name)
    }

    override convenience init(name: String){
        self.init(name: name,quantity: 1)
    }
}


class ShoppingListItem : RecipeIngredient {
    var purchased = false
    var description : String {
        var output = " \(quantity) x \(name) comprado -> "
        output += purchased ? "✔" : "✘"
        return output
    }

}

var breakFastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Orange juice"),
    ShoppingListItem(name: "Grape juice",quantity: 10)
]

breakFastList[0].name = "Lemon juice"

for item in breakFastList {
    print("\(item.description)")
}

