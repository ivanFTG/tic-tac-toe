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

    var isEmpty: Bool {
        !status.contains { $0 != .emptySquare }
    }

    func checkWinner(is player: Robot.Player) -> Bool {
        // Each winnerBoard has 3 positions in a row for a win
        // We just need to cross each winning array with the board status
        for board in winnerBoards(for: player) {
            var result: [String] = []
            for (index, square) in board.enumerated() {
                if status[index] != .emptySquare, status[index] == square {
                    result.append(square)
                }
            }
            if result.count >= 3 {
                return true
            }
        }
        return false
    }

    func areThereAnyMoreMoves() -> Bool {
        status.contains(.emptySquare)
    }

    private func winnerBoards(for player: Robot.Player) -> [[String]] {
        let winnerSquare: String = player == .firstX ? .xSquare : .oSquare
        return [
            [
                winnerSquare,
                winnerSquare,
                winnerSquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                .emptySquare
            ],
            [
                .emptySquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                .emptySquare,
                winnerSquare
            ],
            [
                .emptySquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                winnerSquare,
                winnerSquare,
                winnerSquare
            ],
            [
                winnerSquare,
                .emptySquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                .emptySquare
            ],
            [
                .emptySquare,
                .emptySquare,
                .emptySquare,
                winnerSquare,
                winnerSquare,
                winnerSquare,
                .emptySquare,
                .emptySquare,
                .emptySquare
            ],
            [
                winnerSquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                .emptySquare,
                .emptySquare,
                winnerSquare
            ],
            [
                .emptySquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                winnerSquare,
                .emptySquare,
                .emptySquare
            ]
        ]
    }
}
