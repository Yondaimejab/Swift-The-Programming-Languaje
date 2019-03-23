//Declare variables in swift
	//swift recognize variables datatype
		var number = 22
	// Declare constants using let keyword	
      let sentece = "Hello World";
  print(number)
  print(sentece)

	var aDoubleVar: Double = 44.0
  print(aDoubleVar)
  //Convert to string
  print("\(number) " + sentece)
  //Convert to string
  print(String(number)+" " + sentece)

  var a = 2

  print("\(a)")
  print(String(describing: a))

 //Arrays

 var myArrayOfNumbers = [1,2,3,4,5,6,7,8,9,10]
 var myArrayOfSongs = ["motorsport","679","internacional","i Like It Like That"]

 print(myArrayOfNumbers[9])
 print(myArrayOfSongs[2]) 

 var emptyArray = [String]()
 var emptyArrayFloat = [String: Float]()

 emptyArrayFloat["joel"] = 2.0 
 emptyArray.append("joel")
 print(emptyArray[0])
 print("\(emptyArrayFloat["joel"]!)")