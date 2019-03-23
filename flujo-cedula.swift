import Foundation
//Model
enum Affiliate: String {
    case popularAffiliate = "Afiliado Popular"
    case noAffiliated = "No afiliado"
    case suitAbleForTransfer = "Apto para Traspaso"
    case pendingFromAnoterAfp = "Pendiente de otra afp" 

    var simbol : String  {
        get {
            return getSimbol().rawValue
        }
    } 

    func getSimbol() -> Simbol {
        switch self {
        case .popularAffiliate:
                return Simbol.upArrow
        case .noAffiliated:
                return Simbol.minusSing
        case .suitAbleForTransfer:
                return Simbol.exchangeArrow
        default:
                return Simbol.ex
            
        }
    } 
}


enum Simbol: String {
    case upArrow = "✓"
    case minusSing = "-"
    case exchangeArrow = "↑↓"
    case ex = "X"
}

public class Person {
    var name : String
    var lastName: String
    var dateOfBirth: Date? 
    var age : Int {
        get {
            let calendar = Calendar.current
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "mm/dd/yyyy"
            return calendar.dateComponents([.year], from: dateOfBirth!,to: Date()).year!
        }
    }
    var phones: [String]
    var emails: [String]
    var accountStateByMail: Bool
    var webPageAcces: Bool
    var affiliate : Affiliate 
    var identificationCard : String {
        didSet {
            /*if identificationCard.characters.count != 13 {
                if(identificationCard[identificationCard.index(identificationCard.startIndex,offsetBy:3)] == "-" && identificationCard[identificationCard.index(identificationCard.startIndex,offsetBy:11)] == "-"){
                    for letter in identificationCard.characters {
                        let charAtPosition: Int? = Int(String(letter))
                        if charAtPosition == nil {
                          identificationCard = oldValue
                        }
                    }
                }
            }else{
              identificationCard = oldValue
            }*/
            print(oldValue)
            identificationCard = Person.checkIdentificationCard(idCard: identificationCard,oldValue: oldValue)
            print(oldValue)
        }
    }

    init(){
      self.name = ""
        self.lastName = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        self.dateOfBirth = dateFormatter.date(from: "01/01/01")
        self.identificationCard = ""
        phones = []
        emails = []
        accountStateByMail = false
        webPageAcces = false
        affiliate = Affiliate.noAffiliated
    }
    
    init(name: String, lastName: String,dateOfBirth: String,identificationCard: String){
        self.name = name
        self.lastName = lastName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        self.dateOfBirth = dateFormatter.date(from: dateOfBirth)
        self.identificationCard = identificationCard
        phones = []
        emails = []
        accountStateByMail = false
        webPageAcces = false
        affiliate = Affiliate.noAffiliated
    }

    init(name: String,lastName: String,dateOfBirth: String,phones: [String], emails: [String],accountStateByMail: Bool,webPageAcces: Bool,affiliate: Affiliate,identificationCard: String){
        self.name = name
        self.lastName = lastName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yyyy"
        self.dateOfBirth = dateFormatter.date(from: dateOfBirth)
        self.identificationCard = identificationCard
        self.phones = phones
        self.emails = emails
        self.accountStateByMail = accountStateByMail
        self.webPageAcces = webPageAcces
        self.affiliate = affiliate
    }

    static func checkIdentificationCard(idCard: String,oldValue: String) -> String {
          if idCard.characters.count == 13 {
            if(idCard[idCard.index(idCard.startIndex,offsetBy:3)] == "-" && idCard[idCard.index(idCard.startIndex,offsetBy:11)] == "-"){
                for letter in idCard.characters {
                  if letter != "-" {
                    let charAtPosition: Int? = Int(String(letter))
                    if charAtPosition == nil {
                      
                      return oldValue
                    }
                  }
                }
                return idCard
              }
          }
          return oldValue
    }
}

//Data

class DataRepository {
    static var data: [Person] = [
      Person(name: "joel",lastName: "alcantara",dateOfBirth: "07/29/1999",phones: ["809-741-0623"], emails: ["Alcantara0729@gamil.com"],accountStateByMail: true,webPageAcces: true,affiliate: Affiliate.popularAffiliate,identificationCard: "402-1234567-2"),
      Person(name: "Enmanuel",lastName: "Burgos",dateOfBirth: "07/29/1999",phones: ["809-741-3623"], emails: ["ElFuerte@gmail.com"],accountStateByMail: true,webPageAcces: true,affiliate: Affiliate.noAffiliated,identificationCard: "402-8765432-2"),
      Person(name: "jack",lastName: "pacheco",dateOfBirth: "10/22/1999",phones: ["809-741-1623"], emails: ["jackPacheco@gmail.com"],accountStateByMail: true,webPageAcces: true,affiliate: Affiliate.suitAbleForTransfer,identificationCard: "402-9876543-2"),
      Person(name: "Rolando",lastName: "tara",dateOfBirth: "07/29/1959",phones: ["809-741-2623"], emails: ["enmanuelelContable@gmail.com"],accountStateByMail: true,webPageAcces: true,affiliate: Affiliate.pendingFromAnoterAfp,identificationCard: "402-0987654-2"),
    ]
}

public class DataManager {
    static var sourceData = DataRepository.data
    
    static func CreatePerson(person: Person) -> Bool{
        sourceData += [person]
        return true
    }

    static func UpdatePerson(person: Person) -> Bool{
        for (index,personInData) in sourceData.enumerated() {
            if(person.identificationCard == personInData.identificationCard){
                sourceData[index] = person
                return true
            }
        }
        return false
    }

    static func getAllPerson() -> [Person] {
        return sourceData
    }
    
    static func getPersonByIdCard(idCard: String) -> Person? {
        for personInData in sourceData {
            if(personInData.identificationCard == idCard){
                return personInData
            }
        }
        return nil
    }
}


class PersonController {
    var model : Person?
    var view : View
    
    init(){
      view = View()
      model = Person()
    }

    func startApp() -> Bool {
      let input = view.showHome()
      if input !=  "s" {
        model = DataManager.getPersonByIdCard(idCard: input)
        if(model == nil){
            view.personNotFound()
        }else if let modelo = model{
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "mm/dd/yyyy"
          let dateOfBirth = dateFormatter.string(from:modelo.dateOfBirth!)
          //Hacer while aqui las vista devulve una tupal con un bool y un arreglo
            var again = true
            while(again){
              if view.showResultOfSearch(title: modelo.affiliate.rawValue,simbol: modelo.affiliate.simbol,name: modelo.name,lastName: modelo.lastName, dateOfBirth: dateOfBirth,age: modelo.age){
                  let tupla = view.editPerson(name: modelo.name,lastName: modelo.lastName)
                  if tupla.0 == false {
                    again = tupla.0
                    modelo.phones = tupla.1
                    modelo.emails = tupla.2 
                    modelo.accountStateByMail = tupla.3
                    modelo.webPageAcces = tupla.4
                    print(modelo.phones[0])
                    if DataManager.UpdatePerson(person: modelo) {
                      print("Persona editada correctamente")
                    }
                  }
              }else {
                again = false
              }
            }  
        }
        return true
        //no termina ahi
      }else if input == "s" {
        return false
      }else{
        //Revisar Logica
        return false
      }
    }


}

class View{
    init(){
        print("Bienvenido al programa de Flujo de Cedula.")
    }

    func showHome() -> String{
        var continuar = true
        while(continuar){
            print("\t Consulta de cedulas.")
            print("Para salir presione la tecla s y luego enter")
            print("Digite Una cedula Para consultar")
            let entrada = readLine()
            if let input = entrada {
              if input != "s" {
                if Person.checkIdentificationCard(idCard: input,oldValue: "") != "" {
                  continuar = false
                  return input
                }
              }else{
                continuar = false
                return "s"
              }
            }
            print("Entrada invalida trate de nuevo")
        }
    }

    func showResultOfSearch(title: String,simbol: String,name: String,lastName: String,dateOfBirth: String, age: Int) -> Bool { 
        print("\t \(title)")
        print("\t\t \(simbol)")
        print()
        print("Nombre(s):")
        print("\(name)")
        print("Apellido(s):")
        print("\(lastName)")
        print("Fecha de nacimiento:")
        print(dateOfBirth)
        print("Edad:")
        print("\(age)")
        var entrada = ""
        repeat {
            print("presione v para volver luego enter a si desea actualizar la informacion de este contacto")
            entrada = readLine()!
            if entrada == "a"{
                return true
            }else {
                return false
            }
        } while entrada.isEmpty
    }

    func personNotFound() -> Bool{
        print("/t Ups!")
        print()
        print("No se ha encontrado resultado en nuestra  base de datos")
        print("!")
        print("Intente nuevamente en un horario laboral")
        var entrada = ""
        repeat {
            print("presione v para volver luego enter.")
            entrada = readLine()!
            if entrada == "a"{
                return true
            }else {
                return false
            }
        } while entrada.isEmpty
    }

    //EditPerson
    func editPerson(name: String,lastName: String) -> (option:Bool, phones: [String],emails:[String],accountByEmail:Bool,webPageAccess: Bool){
      var phones = [String]()
      var emails = [String]()
      var accountByEmail = false
      var webPageAccess = false
      print("\t Actualizacion de Usuario")
      print("Nombre(s):")
      print("\(name)")
      print("Apellido(s):")
      print("\(lastName)")
      print("Celular")
      print("Digite el nuevo celular")
      phones += [readLine()!]
      print("Desea Agregar otro Telefono (si o no) ")
      if(readLine()! == "si"){
        print("Digite el Segundo telefono")
        phones += [readLine()!]
        
      }
      print("Correo Electronico:")
      print("Digite su correo electronico")
      emails += [readLine()!]
      print("Desea Agregar otro email (si o no) ")
      if(readLine()! == "si"){
        print("Digite el Segundo correo")
        emails += [readLine()!]
      }
      print("Estado de Cuenta Por Correo.")
      print("Digite si o no")
      var userInput = ""
      userInput = readLine()!
      if userInput == "si" {
        accountByEmail = true
      }else if userInput == "no"{
        accountByEmail = false
      }
      print("Acceso a Pagina Web")
      print("Digite si o no")
      let input = readLine()!
      if input == "si" {
        webPageAccess = true
      }else if input == "no"{
        webPageAccess = false
      }
      var userOption = ""
      repeat{
        print("Desea guardar estos cambios o  volver atras (Digite si para guardar, v para volver)")
        userOption = readLine()!
      }while (userOption != "si" && userOption != "no")

      if userOption == "si" {
       return (option:false,phones: phones,emails: emails,accountByEmail: accountByEmail,webPageAccess:webPageAccess)
      }else {
        return (true,[String](),[String](),false,false)
      }

    }
}


var controller = PersonController()
var continuar : Bool 
repeat{
  continuar = controller.startApp()
}while continuar