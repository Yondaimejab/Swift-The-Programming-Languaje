struct  Player {
    var name : String
    var health: Int
    var Energy: Int

    static var maxHealth = 10

    mutating func restoreHealth(){
        Health = Player.maxHealth
    }
}

extension  Player {
    mutating funcShareHealth(with teammate: inout Player){
        balance(&teammate.health, &health)
    }
    
}

