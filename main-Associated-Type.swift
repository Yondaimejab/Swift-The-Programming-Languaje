protocol Container  {
    associatedtype Item
    mutating func append(_ item: Item)

    var count: Int {get}

    subscript(i: Int) -> Item {get} 
    
}

//nongenerick stack 

struct IntStack: Container {
    var items = [Int]()

    mutating func push(_ item: Int){
        items.append(item)
    }

    mutating func pop() -> Int{
        return items.removeLast()
    }

    typealias Item = Int

    mutating func append(_ item: Int){
        self.push(item)
    } 

    var count: Int {
        return items.count
    } 

    subscript(i: Int) -> Int {
        return items[i]
    } 
} 


struct GenericStack<Element>: Container {
    var items = [Element]()

    mutating func push(_ element: Element){
        items.append(element)
    }

    mutating func pop() -> Element {
        return items.removeLast()   
    }

    mutating func append(_ item: Element){
        self.push(item)
    }

    var count : Int {
        return items.count  
    }

    subscript(i: Int) -> Element {
        return items[i]
    }
 }

 func allItemsMacth<C1: Container,C2: Container> 
 (_ someContainer: C1,_ anotherContainer: C2) -> Bool         where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count == anotherContainer.count {
        return false
    }

    for i in 0..<someContainer.count {
    if someContainer[i] != anotherContainer[i] {
        return false
        }
    }

    return true
}

extension Array : Container {}

var arr = [1,2,3]
var arr2 = [1,2,3]
if allItemsMacth(arr,arr2){
    print("Todo bien")
}else {
    print("todo mal")
}


extension GenericStack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else{
            return false
        }
        return topItem == item
    }
}


var gStack = GenericStack<Int>()
gStack.append(1)
gStack.append(2)
gStack.append(3)
print(gStack.isTop(3))

/*
struct NotEquatable {

}

var notEquatableStack = GenericStack<NotEquatable>()
var notEquatableValue =     NotEquatable()
notEquatableStack.push(notEquatableValue)
notEquatableStack.isTop(notEquatableValue)
*/

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for i in 0..<count {
            sum += self[i]
        }
        return sum / Double(count)
    }
}

print(gStack.average())