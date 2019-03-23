You can return more than one value by using tuplas in function 

func getAllNames() -> ( boss: String, captain: String, worker: String){
 
 return ("Joel","Rolando","enmanuel")
}

var myNewVar = getAllNames()
print(myNewVar.worker)