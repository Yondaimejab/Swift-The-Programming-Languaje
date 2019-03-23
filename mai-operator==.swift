prefix operator +++

struct Valor {
    var firstValue : Int
    var secundValue: Int?

    init(first: Int,secund: Int?){
        self.firstValue = first
        self.secundValue = secund
    }
}

enum Suit: String {
    case hearts = "Corazones rojos"
    case spades = "corazones negros"
    case trebol = "trebol"
    case diamonds = "Diamante" 
}

struct Card: CustomStringConvertible{
    var suit: Suit
    var valor: Valor?

    var description: String {
      if let tempValor = valor {
        if tempValor.secundValue != nil {
          //Codigo repetido debe de haber una forma de mejorarlo
          return "\(tempValor.firstValue) or \(tempValor.secundValue!) de \(suit.rawValue)"    
        }else if tempValor.secundValue != nil {
          return  "\(tempValor.firstValue) de \(suit.rawValue)" 
        } 

      }
      return "no existe la carta"
    }
    init(suit: Suit,valor: Valor?){
        self.suit = suit
        self.valor = valor
    }

    static func == (firstCard: Card,secundCard: Card) -> Bool{
        if(firstCard.suit == secundCard.suit){
          if  let first = firstCard.valor,
            let secund = secundCard.valor
            {
             if first.firstValue == secund.firstValue { 
              return true
             }
          }  
        }
        return false
    }
    
    static func != (firstCard: Card,secundCard: Card) -> Bool{
        if firstCard.suit != secundCard.suit, 
        let first = firstCard.valor,
        let secund = secundCard.valor {
            if first.firstValue != secund.firstValue{
              return true
            }
            return true
        }
        return false
    }
    
    static prefix func +++ (card: inout Card){
        if let cardValue = card.valor {
            card.valor!.firstValue += cardValue.firstValue
            if(cardValue.secundValue != nil){
                card.valor!.secundValue! += cardValue.secundValue! 
            }
        } 
    }
}

var value: Int? = 2 
var cardOne = Card(suit: Suit.hearts,valor: Valor(first:1,secund:value) )
var cardTwo = cardOne
var cardThree = Card(suit: Suit.hearts,valor: Valor(first:1,secund:3) )

print(cardOne)
print(String(describing: cardOne))

if(cardOne == cardTwo){
    print("Ta funcionando")
}else {
    print("Algo anda mal")
}

if(cardThree != cardTwo){
    print("Ta funcionando")
}else {
    print("Algo anda mal")
}
