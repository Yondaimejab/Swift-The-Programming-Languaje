var numbers = [1,2,3,4,5,6,7,8,9,10]

 numbers = numbers.map({ (number: Int) -> (Int) in
  var result = number * 3
  if result % 2 != 0{
    result = 0
  } 
  return result
})

print(numbers)