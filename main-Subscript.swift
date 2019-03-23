struct Names {
  var characterInName = [Character]()
  
  init(name: String){
      let a = name.characters.count
      for letter in 0..<a {
        characterInName.append(
          
            name[
              name.index(
                name.startIndex, offsetBy: letter)
                
              ]
        )
      }
  }

  subscript(i: Int) -> Character {
    return characterInName[i]
  }
}

var name = Names(name: "Joel")

print(name[0])