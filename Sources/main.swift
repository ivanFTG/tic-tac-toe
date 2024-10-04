import Foundation

let robotX = Robot(player: .firstX)
let robotO = Robot(player: .secondO)
let board = Board()

let game = Game(robotX: robotX, robotO: robotO, board: board)
let gameEnd = game.runGame()
switch gameEnd {
case .draw:
    print("draw")
case .winnerDecided:
    print("winner")
}
