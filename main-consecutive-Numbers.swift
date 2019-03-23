var continuar = true
var userSelection: String = ""
var listOfDigitsInString: String = ""
var listOfDigitsInStringIsValid = false
var listOfDigitsAsNumbers = [Int]()
var listOfNumberWithMoreNumbersInRow = [Int]()
var listOfDigits = [Int]()
while(continuar) {
    print("Welcome to the program consecutive number counter")
    print("1.) Insert list of numbers.")
    print("2.) get out.")
    print("Type your Selecction.")
    userSelection = readLine()!

    while userSelection.isEmpty || userSelection != "1" && userSelection != "2" {
       print("Write a valid input  (1,2)")
        userSelection = readLine()!
    } 

    if userSelection == "2" {
      continuar = false
      print("GoodBye ComeBack.")
    }else{
      print("type the list of numbers you want to analize")
      listOfDigitsInString = readLine()!
      if listOfDigitsInString.isEmpty {
        listOfDigitsInStringIsValid = false
      }

      for char in listOfDigitsInString.characters {
          var temp = Int(String(char))
          if let aux = temp {
            listOfDigitsAsNumbers.append(aux) 
            listOfDigitsInStringIsValid = true
          }else {
            listOfDigitsInStringIsValid = false
          }
          
      }
      
      if listOfDigitsInStringIsValid {
        for (index,number) in listOfDigitsAsNumbers.enumerated() {
          //si no hay un numero anterior entonces quiero una nueva lista 
          if index == 0  {
            listOfDigits = [number]
          }else{
            //si el numero anterior es igual a este numero menos 1 son consegutivos
            if listOfDigitsAsNumbers[index - 1] == number - 1 {
              listOfDigits.append(number)
              print(number)
              if listOfNumberWithMoreNumbersInRow.count < listOfDigits.count {
                listOfNumberWithMoreNumbersInRow = listOfDigits
              }
            }else{
              // si el numero anterior no es igual a  este numero menos 1 comprar las listas y cambiala de ser necesario
              if listOfNumberWithMoreNumbersInRow.count < listOfDigits.count {
                listOfNumberWithMoreNumbersInRow = listOfDigits
                listOfDigits = [number]
                print(listOfDigits)
              }else{
                listOfDigits = [number]
              }
            } 
          }

        }
      }
      

      print(listOfNumberWithMoreNumbersInRow)


    }
    
}