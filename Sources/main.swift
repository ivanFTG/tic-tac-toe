import Foundation

let robotX = Robot(player: .firstX)
let robotO = Robot(player: .secondO)
let board = Board()
let game = Game(robotX: robotX, robotO: robotO, board: board)

print("\n\nWELCOME TO THE TIC-TAC-TOE")

let gameEnd = game.runGame()
switch gameEnd {
case .draw:
    print("\nSadly...there has been a DRAW...\n")
case .winnerDecided(let player):
    switch player {
    case .firstX:
        print("\nTHE WINNER IS ROBOT X!!!\n")
    case .secondO:
        print("\nTHE WINNER IS ROBOT O!!!\n")
    }
}
