struct LevelTracker {
    static var highestUnlokedLevel = 1
    var currentLevel = 1

     static func unlock(_ level: Int){
        if(level == highestUnlokedLevel){
            highestUnlokedLevel = level+1
        }
    }

    static func isUnlock(_ level: Int) -> Bool {
        return level <= highestUnlokedLevel
    }

    mutating func advance(_ level: Int) -> Bool {
        if (LevelTracker.isUnlock(level)){
            currentLevel = level
            return true
        }else{
            return false
        }
    }

    mutating func advanceToLevel(levelToAdvance: Int,player: Player){
        let missingLevelsToComplete = levelToAdvance - player.tracker.currentLevel
        print(missingLevelsToComplete)
        for level in missingLevelsToComplete...levelToAdvance {
          player.completeLevel(level: (level - 1))
        }
    }

}

class Player {
    var tracker = LevelTracker()
    var name : String
    
    init(name: String){
        self.name = name
    }

    func completeLevel(level: Int){
        LevelTracker.unlock(level)
        if(tracker.advance(level+1)){
            print("Nivel \(level) completado avanza a el nivel \(level+1) ")
        }else{
            print("Cant advance to level \(level) you have to complete \((level - LevelTracker.highestUnlokedLevel)) levels more.")
        } 
    }

    func jumpToLevel(_ level: Int){
      tracker.advanceToLevel(levelToAdvance: level, player: self)
    }

}

var player = Player(name: "Joel")
var levelToAComplete = 1
player.completeLevel(level: levelToAComplete)
player.completeLevel(level: 2)
player.completeLevel(level: 3)
player.completeLevel(level: 7)
player.jumpToLevel(9)