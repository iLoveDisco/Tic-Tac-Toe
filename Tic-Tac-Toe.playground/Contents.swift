class TicTacToeGame: CustomStringConvertible{
    enum MarkType: String {
        case none
        case x = "X"
        case o = "O"
    }
    var board: [MarkType]
    
    enum State: String {
        case xTurn = "X's turn"
        case oTurn = "O's turn"
        case xWin = "X wins"
        case oWin = "O wins"
        case tie = "Tie Game"
    }
    var state: State
    
    init() {
        board = [MarkType](repeating: .none, count: 9)
        state = .xTurn
    }
    
    func pressedSquareAt(_ index : Int) {
        if (board[index] != .none) {
            print("This square (\(index)) is not empty")
            return
        }
        
        switch state {
        case .xWin, .oWin, .tie:
            print("Game is over")
        case .xTurn:
            board[index] = .x
            state = .oTurn
        case .oTurn:
            board[index] = .o
            state = .xTurn
        }
        
        checkForWin()
        print(self)
    }
    
    func checkForWin() {
        
        if !board.contains(.none) {
            state = .tie
            return
        }
        var threeLines = [String]()
        
        threeLines.append(getBoardString([0,1,2]))
        threeLines.append(getBoardString([3,4,5]))
        threeLines.append(getBoardString([6,7,8]))
        
        threeLines.append(getBoardString([0,3,6]))
        threeLines.append(getBoardString([1,4,7]))
        threeLines.append(getBoardString([2,5,8]))
        
        threeLines.append(getBoardString([0,4,8]))
        threeLines.append(getBoardString([6,4,3]))

        for s in threeLines{
            if s == "X X X " {
                state = .xWin
                print("X wins!")
            } else if s == "O O O " {
                state = .oWin
                print("O wins!")
            }
        }
    }
    
    func getBoardString(_ indices : [Int] = [0,1,2,3,4,5,6,7,8], isPretty : Bool = false) -> String {
        var gameString = ""
        for i in indices{
            if i % 3 == 0 && isPretty{
                gameString += "\n"
            }
            
            if board[i] == .none {
                gameString += "- "
            } else {
                gameString += board[i].rawValue + " "
            }
        }
        
        return gameString
    }
    
    var description: String {
        return "\(state) Board: \(getBoardString(isPretty: true))"
    }
}

var game = TicTacToeGame()
print(game)

game.pressedSquareAt(0)
game.pressedSquareAt(1)
game.pressedSquareAt(3)
game.pressedSquareAt(2)
game.pressedSquareAt(6)


