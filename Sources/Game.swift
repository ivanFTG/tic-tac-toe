import Foundation

class Game {
    enum End {
        case winnerDecided(player: Robot.Player)
        case draw
    }
    private let robotX: Robot
    private let robotO: Robot
    private let board: Board

    private var winner: Robot.Player?
    private var nextPlayer: Robot.Player = .firstX

    init(robotX: Robot, robotO: Robot, board: Board) {
        self.robotX = robotX
        self.robotO = robotO
        self.board = board
    }

    func runGame() -> End {
        print("Game is running")
        // we will do the following
        // 1. check if there is a winner in the board. Finish the game if yes
        // 2. check if there can be any more moves in the board. Finish the game if yes
        // 3. check nextplayer and make it do a move on the board
        // 4. change nextplayer to the other player
        // 5. call again runGame
        return .draw
    }
}
