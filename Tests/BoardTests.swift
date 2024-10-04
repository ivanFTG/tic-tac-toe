import Testing
@testable import TicTacToe

struct BoardTests {
    @Test("Board initial status should be empty board")
    func testInitialBoard() {
        let board = Board()
        let initialBoard: [String] = [
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
        #expect(board.status == initialBoard, "Initial Status should be empty")
    }

    @Test("Board checkWinner should return nil for not finished game")
    func testNonFinishedBoard() {
        let board = Board()
        board.status = [
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
        #expect(board.checkWinner() == nil, "Board should have no result yet")
    }

    @Test("Board checkWinner should return draw")
    func testDrawBoard() {
        let board = Board()
        board.status = [.xSquare, .xSquare, .oSquare, .oSquare, .oSquare, .xSquare, .xSquare, .xSquare, .oSquare]
        #expect(board.checkWinner() == nil, "Board should return a draw result")
    }

    @Test("Board checkWinner should return firstX player")
    func testWinnerFirstXBoard() {
        let board = Board()
        board.status = [
            .xSquare,
            .emptySquare,
            .oSquare,
            .xSquare,
            .emptySquare,
            .oSquare,
            .xSquare,
            .emptySquare,
            .emptySquare
        ]
        #expect(board.checkWinner() == .firstX, "Board should return a firstX result")
    }

    @Test("Board checkWinner should return secondO player")
    func testWinnerSecondOBoard() {
        let board = Board()
        board.status = [
            .oSquare,
            .emptySquare,
            .xSquare,
            .xSquare,
            .oSquare,
            .emptySquare,
            .xSquare,
            .emptySquare,
            .oSquare
        ]
        #expect(board.checkWinner() == .secondO, "Board should return a secondO result")
    }

    @Test("Board areThereAnyMoreMoves should return true")
    func testMoreMovesInBoard() {
        let board = Board()
        board.status = [
            .oSquare,
            .emptySquare,
            .emptySquare,
            .xSquare,
            .emptySquare,
            .emptySquare,
            .xSquare,
            .emptySquare,
            .oSquare
        ]
        #expect(board.areThereAnyMoreMoves(), "Board should have more moves")
    }

    @Test("Board areThereAnyMoreMoves should return false")
    func testNoMoreMovesInBoard() {
        let board = Board()
        board.status = [.xSquare, .xSquare, .oSquare, .oSquare, .oSquare, .xSquare, .xSquare, .xSquare, .oSquare]
        #expect(!board.areThereAnyMoreMoves(), "Board should have no more moves")
    }
}
