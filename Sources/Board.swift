import Foundation

class Board {
    var status: [String] = [
        .emptySquare,
        .emptySquare,
        .emptySquare,
        .emptySquare,
        .emptySquare,
        .emptySquare,
        .emptySquare,
        .emptySquare,
        .emptySquare
    ]

    func checkWinner() -> Robot.Player? {
        // we need to check if there is a winner in the board
        return nil
    }

    func areThereAnyMoreMoves() -> Bool {
        return false
    }
}
