import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

var continuar = true
var frase : String? = ""
while continuar {
    print("Esta es la aplicacion de diccionario. (fuente Wikipedia)")
    repeat{
        print("Digite la frase que desea buscar")
        frase = readLine()
    }while(frase!.isEmpty || frase == nil)
    if frase!.range(of: " ") != nil {
        frase = frase!.replacingOccurrences(of: " ",with: "")
    }
    let urlApiWikipedia = "https://es.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=\(String(describing: frase))"
    if frase != "s" {
      let urlObject = Url(string: urlApiWikipedia)
      let task = UrlSession.shared.dataTask(with: urlObject!) {(datos,respuesta,error) in
        if error != nil {
          print(error!)
        }else{
          do{
            let json = try JSONSerialization.jsonObject(with: datos!,options: JSONSerialization.ReadingOptions.mutableContainers) as [String: Any]

            print(json)
          }catch{
            print("no se ah podido procesar el json")
          }
        }

      }
    }else{
      continuar = false
    }

    
}