func generateName(name: String) -> String {
  var name = name 
  name = "kk"
  return name
}

//para utilizar 
func myFunction(_ person: String, _ condition: (String) -> String ) -> String {
  print(person)
  var person = person
  person = condition(person);
  return person 
}

let sentence = myFunction("Joel",generateName)

print(sentence)
print(generateName(name: "joel"))


func getName(personName person: String) -> (String){
  return person
}

func greet(message gretting: String,nameOfAperson name:String, condition: (String) -> (String) ){
  print(gretting + condition(name))
}

greet(message: "Hello and Welcome to our workplace mr.",nameOfAperson: "Alcantara",condition: getName)