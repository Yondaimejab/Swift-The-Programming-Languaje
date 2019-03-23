enum Rank: Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    case predeterminado
    func SimpleDesciption() -> Int{
        switch self {
        case .Ace:
            return self.rawValue
        case .Two:
            return self.rawValue
        case .Three:
            return self.rawValue
        case .Four:
            return self.rawValue
        case .Five:
            return self.rawValue
        case .Six:
            return self.rawValue
        case .Seven:
            return self.rawValue
        case .Eight:
            return self.rawValue
        case .Nine:
            return self.rawValue
        case .Ten:
            return self.rawValue
        case .Jack:
            return self.rawValue
        case .Queen:
            return self.rawValue
        case .King:
            return self.rawValue
        default:
            return self.rawValue
            
        }
    }
}

enum Suit: Int {
    case spades = 1
    case diamonds,hearts,clubs
    
    func SimpleDesciption() -> String {
        switch self {
            case .spades:
                return "Spades"
            case .diamonds:
                return "Diamonds"
            case .hearts:
                return "Hearts"
            case .clubs:
                return "Clubs"
        }

    }

    func color() -> String {
        switch self {
            case .spades:
                return "black"
            case .diamonds:
                return "red"
            case .hearts:
                return "red"
            case .clubs:
                return "black"
        }
    }
}

struct Card {
    var rank : Rank
    var suit : Suit
    func SimpleDesciption() -> String{
        return  "The \(rank.SimpleDesciption()) of \(suit.SimpleDesciption())"
    }
}

let TenOfDiamonds = Card( rank: Rank.Three, suit: .spades)

var deck = [Card]()
for indexOfSuit in 1...4 {
    for indexOfRank in 1...13 {
        deck.append(
          Card(
            rank: Rank(rawValue: indexOfRank)!, 
            suit: Suit(rawValue: indexOfSuit)!  
            )
          )
      }
  }

for card in deck{
  print(card.SimpleDesciption())
}