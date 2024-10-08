import Testing
@testable import TicTacToe

struct RobotTests {
    @Test("Robot should set the correct player")
    func robotIsInitialisedCorrectly() {
        var robot = Robot(player: .firstX)
        #expect(robot.player == .firstX, "Robot should have configured player firstX")

        robot = Robot(player: .secondO)
        #expect(robot.player == .secondO, "Robot should have configured player secondO")
    }

    @Test("Robot should set the correct player")
    func robotCanMakePlayCorrectly() {
        let initialBoardStatus: [String] = [
            .xSquare,
            .emptySquare,
            .oSquare,
            .emptySquare,
            .xSquare,
            .emptySquare,
            .oSquare,
            .emptySquare,
            .emptySquare
        ]
        let initialXSquareCount = 2
        let initialOSquareCount = 2

        let board = Board()
        board.status = initialBoardStatus

        var robot = Robot(player: .firstX)
        robot.makePlayInBoard(board)
        let newXSquareCount = board.status.count { $0 == .xSquare }
        #expect(newXSquareCount == initialXSquareCount + 1, "Robot should have added player firstX move")

        board.status = initialBoardStatus

        robot = Robot(player: .secondO)
        robot.makePlayInBoard(board)
        let newOSquareCount = board.status.count { $0 == .oSquare }
        #expect(newOSquareCount == initialOSquareCount + 1, "Robot should have configured player secondO")
    }

    @Test("Robot should not make a play when a full board is passed")
    func robotDoesntMakePlayOnFullBoard() {
        let initialBoardStatus: [String] = [
            .xSquare,
            .xSquare,
            .oSquare,
            .xSquare,
            .xSquare,
            .oSquare,
            .oSquare,
            .oSquare,
            .xSquare
        ]

        let board = Board()
        board.status = initialBoardStatus

        let robot = Robot(player: .firstX)
        robot.makePlayInBoard(board)
        #expect(board.status == initialBoardStatus, "Robot should have not made a play")
    }
}
