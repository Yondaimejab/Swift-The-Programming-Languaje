//using the property indices in arrays i can get an array of the indices so i can use them later

var greeting = ["hola","adios"]

for letra in greeting.indices {
  for sentence in greeting{
    print("\(greeting[letra])  \(sentence)")
  }
}

Manipulation dictionarys
	
	let interestingNumbers = [
  "Prime": [2,3,5,7,11,13],
  "Fibonacci": [1,1,2,3,5,8,13,21,34],
  "Scuare": [1,4,9,16,25]
]

var biggerNumber = 0
var biggerNumberKind = ""

for (kind,numbers) in interestingNumbers{
  for number in numbers{
    if number > biggerNumber{
      biggerNumber = number
      biggerNumberKind = kind
    }
  }
}

print("The biggerNumber is: \(biggerNumber) and its kind is : \(biggerNumberKind)" )