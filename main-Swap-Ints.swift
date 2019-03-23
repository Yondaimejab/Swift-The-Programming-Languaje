//in and out parameters
var firstValue = 10
var secundValue = 20

func swapInts(swap a: inout Int, to b: inout Int){
  let temporaryValue = a
  a = b 
  b = temporaryValue
  print("you swap \(b) for \(a)")
}

swapInts(swap: &firstValue,to: &secundValue)
 print(firstValue)
 print(secundValue)