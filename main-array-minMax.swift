func minMax(from array: [Int]) -> (min: Int,max: Int)? {
    if array.isEmpty { return nil}
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if currentMin > value {
            currentMin = value
        }
        if currentMax < value { 
            currentMax = value
        }
    }

    return (min: currentMin,max: currentMax)
}
var arr = [1,12,3,4,5,0]
let tupla = minMax(from: arr )!
print(tupla.min)
print(tupla.max)