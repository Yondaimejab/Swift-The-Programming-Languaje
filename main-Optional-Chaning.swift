class Person {
    var residence : Residence? 
}

class Residence {
    var numberOfRooms = 1
}

var jhon = Person()

if let rooms = jhon.residence?.numberOfRooms {
    print("amount of rooms in jhons residence \(rooms)")
}else{
    print("jhon doesnt have no residence")
}

//print(jhon.residence.numberOfRooms)
