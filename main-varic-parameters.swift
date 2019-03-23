//Varic parameters

func friends(_ myFriends: String...){
  for friend in myFriends{
    print("\(friend) is a really good friend")
  }
}

//when you wnat to send a unknown amount of parameter of the same type you use varic parameters  
friends("Bryan","Ray","Erick","David","Joan")
friends("evelin","canita","Eduvijes")
