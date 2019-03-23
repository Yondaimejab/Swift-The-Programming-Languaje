//Model
class Snake{
    var name: String
    var position: Int

    init(name:String){
        self.name = name
        position = 0  
    }

    func move(steps: Int){
        position += steps
    }
}

class SnakeGame {
    let finalSquare: Int
    var board : [Int]
    var player: Snake

    init(playerName name: String){
        finalSquare = 25
        board = [Int](repeating: 0, count: finalSquare + 1)
        //shuffleBoardLeaders(times: 6)
        player = Snake(name: name)

    }

    func shuffleBoardLeaders(times: Int){
        for number in 1...times {
            let item = 5
            if  (number % 2 == 0) {
                board[item] += number
            }else {
                board[item] -= number
            }
        }
    }

    func rollDice() -> Int{
        let item = 5
        return item
    }

    func play()-> (endGame:Bool, steps: Int) {
        let amoutOfSteps = rollDice()   

        player.move(steps: amoutOfSteps)
        if(player.position > board.count-1){
              player.position = board.count
        }else{
          if(board[player.position] != 0){
            player.move(steps: board[player.position-1])
          }
        }
        
        if checkForEndOfGame() {
            return (true,amoutOfSteps)
        }
        return (false,amoutOfSteps)
    }

    func checkForEndOfGame() -> Bool {
        if (finalSquare <= player.position){
            return true
        }
        return false
    }    
}

//Controler
class Controller {
    var game: SnakeGame
    var vista: Vista
    static var createNewGame = false

    init(){
        vista = Vista()
        vista.welcome()
        game = SnakeGame(playerName: vista.playerName!)
        game.shuffleBoardLeaders(times: 6)
    }

    func readyToPlay(){
        if vista.startGame() {
            var gameInfo = game.play() 
            vista.showBoard(boardUnderCores: game.board.count)
            vista.diceResult(steps: gameInfo.steps)

            while(gameInfo.endGame == false){
              if vista.keepPlaying(){
                gameInfo = game.play()
                vista.showBoard(elements:game.board, playerPosition: game.player.position)
                vista.diceResult(steps: gameInfo.steps)
              }
            }

            if gameInfo.endGame {
              let temp: Bool = vista.gameOver(winner: game.player.name)
                if !temp {
                    Controller.createNewGame = true
                }
            }
            
        }
    }



}


//View

class Vista {
    var playerName: String? = ""

    func diceResult(steps: Int){
        print("the result of thowing the dices is : \(steps)")
    }

    func welcome(){
        print("Welcome to the game of the snake")
        print("whats your name?")
        playerName = readLine()
    }

    func showBoard(boardUnderCores: Int){
        for position in 0...boardUnderCores {
            if(position % 4 == 0){
                if(position != 0){
                  print("_")
                }
            }else if position == boardUnderCores{
                print("_")
            }else{
                print("_\t", terminator:"")
            }     
        }
    }

    func chooseCharacterToPrint(indice: Int,array: [Int],position: Int) -> String{
      if(indice == position){
        return "S"
      }else if(array[indice] != 0){
        return "L"
      }else{
        return "_"
      }
    }

    func showBoard(elements: [Int],playerPosition: Int){
      for index in elements.indices {
          if(index % 4 == 0){
              if(index != 0){
                  print(chooseCharacterToPrint(indice: index,array: elements, position: playerPosition))
              }
            }else if index == elements.count {
                print(chooseCharacterToPrint(indice: index,array: elements, position: playerPosition))
            }else{
                print("\(chooseCharacterToPrint(indice: index,array: elements, position: playerPosition))\t",terminator: "")
            }  
      }  
    }

    func gameOver(winner name:String) -> Bool {
        print("The game is over \(name) wins")
        var answer: String? = ""
        while(answer != "yes" && answer != "no"){
            print("Do you wish to play again (yes or no)")
            answer = readLine()
        }

        if(answer! == "yes"){
            return false
        }   

        return true

    }

    func startGame() -> Bool{
        var answer: String? = ""
        
        while(answer != "yes" && answer != "no"){
            print("Are you ready to play (yes or no)")
             answer = readLine()
        }
       
        if(answer == "yes"){
            return true
        }   

        return false

    }

    func keepPlaying() -> Bool{
      var answer: String? = ""
      while(answer != "r"){
        print("press 'r' and  then 'enter'  to move")
        answer = readLine()
        if answer == "r" {
          return true
        }
      }
      return false
    }

}


var controller = Controller()
controller.readyToPlay()
while(Controller.createNewGame){
    controller = Controller()
    controller.readyToPlay()
}

