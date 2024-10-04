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
        // the robot makes a random play on the board
    }
}
