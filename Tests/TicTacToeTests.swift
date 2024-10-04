import Testing

struct TicTacToeTests {

    @Test("First Test")
    func firsTest() {
        let result = 2 + 2
        #expect(result == 4, "Addition should equal to 4")
    }
}
