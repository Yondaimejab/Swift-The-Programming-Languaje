enum Rank: Int{
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King 

    func simpleDescription() -> Int{
        switch self{
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
        }
    }   
}

func compareRawValues(firstValue first: Rank,secundValue secund: Rank){
    let firstRawValue = first.rawValue
    let secundRawValue = secund.rawValue
    if firstRawValue == secundRawValue{
        print("El numero de los valores es igual")
    }else if(firstRawValue > secundRawValue){
        print("El primer valor es mas grande que el segundo")
    }else{
        print("El segundo valor es el valor mas grande")
    }
}

let Ace =  Rank.Ace
let King = Rank.Queen

compareRawValues(firstValue: Ace,secundValue: King)