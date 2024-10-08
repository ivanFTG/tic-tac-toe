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
        if board.isEmpty {
            print("\nGame is starting!!!")
            printBoard()
        }
        // we will do the following
        // 1. check if there is a winner in the board. Finish the game if yes
        // 2. check if there can be any more moves in the board. Finish the game if yes
        // 3. check nextplayer and make it do a move on the board
        // 4. change nextplayer to the other player
        // 5. call again runGame
        if board.checkWinner(is: .firstX) {
            return .winnerDecided(player: .firstX)
        } else if board.checkWinner(is: .secondO) {
            return .winnerDecided(player: .secondO)
        } else if board.areThereAnyMoreMoves() {
            print("\nNext Move!")
            switch nextPlayer {
            case .firstX:
                moveX()
                nextPlayer = .secondO
            case .secondO:
                moveO()
                nextPlayer = .firstX
            }
            printBoard()
            return runGame()
        } else {
            return .draw
        }
    }

    private func printBoard() {
        print(
            """
            _______
            |\(board.status[0])|\(board.status[1])|\(board.status[2])|
            |\(board.status[3])|\(board.status[4])|\(board.status[5])|
            |\(board.status[6])|\(board.status[7])|\(board.status[8])|
            -------
            """
        )
    }

    private func moveX() {
        print("Bot X will make a move!")
        robotX.makePlayInBoard(board)
    }

    private func moveO() {
        print("Bot O will make a move!")
        robotO.makePlayInBoard(board)
    }
}
