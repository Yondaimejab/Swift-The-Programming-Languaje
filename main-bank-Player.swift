class Bank {
    static var coinsInBank  = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int{
        let numberOfCoinsToVent = min(numberOfCoinsRequested,coinsInBank)
        coinsInBank -= numberOfCoinsToVent
        return numberOfCoinsToVent
    }

    static func recieve(coins: Int){
        coinsInBank += coins
    }
} 

class Player {
    var name: String
    var coinsInPurse : Int
    
    init(name: String, coins: Int) {
        self.name = name
        coinsInPurse = Bank.distribute(coins: coins)
    }

    func win(coins: Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }

    deinit{
        Bank.recieve(coins: coinsInPurse)
    }

}

var player : Player? = Player(name: "Joel",coins: 1000)
player!.win(coins: 1000)
player = nil
print(Bank.coinsInBank)