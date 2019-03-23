func makeArray<Item>(repeatin item: Item, numberOfTimes: Int) -> [Item]{
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result += [item]
    }
    return result;
}

let array = makeArray(repeatin: 250, numberOfTimes: 4);
print(array)

var firstArr = [1,2,3]
var secunArr = [3,4,5]

func anyCommonElements<Item: Equatable>(_ firstArray: [Item],_ secundArray: [Item]) -> [Item]  {
    var result = [Item]()
    for something in firstArray{
        for algo in secundArray{
            if algo == something {
                result += [something]
            }
        }
    }
    return result
}

let result = anyCommonElements(firstArr,secunArr)
print(result)