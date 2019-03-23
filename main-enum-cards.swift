enum Suit{
    case spades,hearts,diamonds,clubs
    func simpleDiscription() -> String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "Hearts"
        case .diamonds:
            return "Diamonds"
        case .clubs:
            return "Clubs"
        }
    }

    func color() -> String {
        switch self {
        case .spades:
            return "black"
        case .hearts:
            return "Red"
        case .diamonds:
            return "Red"
        case .clubs:
            return "black"
        }
    }

}
let hearts = Suit.hearts
let heartsDescription =  hearts.simpleDiscription()
let heartscolor = hearts.color()
print(hearts)
print(heartsDescription)
print(heartscolor)