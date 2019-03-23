class ShoppingList {
    var name: String?
    var quatity = 1
    var purchased = false 
}

var item = ShoppingList()

struct Size {
    var width = 0.0
    var heigth = 0.0
}

let size = Size(width: 15.0,heigth: 10.2)

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var size = Size()
    var origin = Point()

    init(){}

    init(origin: Point,size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point,size: Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.heigth / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0,y: 2.0),size: Size(width: 5.0,heigth: 5.0))
let centerRect = Rect(center: Point(x: 4.0,y: 4.0),size: Size(width: 3.0,heigth: 3.0))


