import Foundation

class Robot {
    enum Player {
        case firstX
        case secondO
    }

    let player: Player

    init(player: Player) {
        self.player = player
    }

    func makePlayInBoard(_ board: Board) {
        var initialBoard = board.status
        let boardSize = initialBoard.count
        let initialEmptySquares = initialBoard.count { $0 == .emptySquare }
        var endEmptySquares = initialEmptySquares
        while initialEmptySquares > 0, initialEmptySquares == endEmptySquares {
            let randomSquare = Int.random(in: 0..<boardSize)
            if initialBoard[randomSquare] == .emptySquare {
                initialBoard[randomSquare] = player == .firstX ? .xSquare : .oSquare
                endEmptySquares -= 1
                board.status = initialBoard
            }
        }
    }
}
