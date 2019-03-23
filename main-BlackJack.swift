struct  BlackJackCards : CustomStringConvertible {

    enum Suit : Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    enum Rank : Int {
        case two = 2, three, four, five, six, sevent, eight, nine, ten
        case jack, queen, king, ace

        struct Values {
            let first: Int, second: Int?

            init(first: Int,second: Int?){
                self.first = first
                self.second = second
            }
        }

        var values : Values {
            switch self {
            case .ace:
                return  Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue,second: nil)
            }
        }

    }

    let rank: Rank, suit: Suit
    var description : String {
        var output = "suit is \(suit.rawValue), \(rank.values.first)"
        if let second = rank.values.second {
            output += "or \(second)" 
        }
        return output
    } 
    
}


let simbols: [BlackJackCards.Suit] = [
    BlackJackCards.Suit.spades,
    BlackJackCards.Suit.hearts,
    BlackJackCards.Suit.diamonds,
    BlackJackCards.Suit.clubs,
]

let values : [BlackJackCards.Rank] = [
    BlackJackCards.Rank.ace,
    BlackJackCards.Rank.two,
    BlackJackCards.Rank.three,
    BlackJackCards.Rank.four,
    BlackJackCards.Rank.five,
    BlackJackCards.Rank.six,
    BlackJackCards.Rank.sevent,
    BlackJackCards.Rank.eight,
    BlackJackCards.Rank.nine,
    BlackJackCards.Rank.ten,
    BlackJackCards.Rank.jack,
    BlackJackCards.Rank.queen,
    BlackJackCards.Rank.king
]

print(values)
print(simbols)
var deckOfCards = [BlackJackCards]()
let hola = BlackJackCards(rank: values[0],suit: simbols[0])
print("\(hola)")

for item in simbols.indices {
    for value in values {
        deckOfCards.append(BlackJackCards(
            rank: value,
            suit: simbols[item]
            )
        )
    }
}

for card in deckOfCards {
    print("\(card)")
}
