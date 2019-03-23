//Implicit unWrapping

//let myString : String? = "Joel"
let myString : String? = nil
  // the new var get the  old var value and the if checks if old var is nul and decides if running the code or not
if let sentence = myString  {
  print(sentence)
}else{
  print("nada que imprimir.")
}
//Use an default value if null 
print("\(myString ?? "hello")")
//No cambia el valor aun asi es muy util
//reduce la cantidad de codigo que debe de usar
print(myString)