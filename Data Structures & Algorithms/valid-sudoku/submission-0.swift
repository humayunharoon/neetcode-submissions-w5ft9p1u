struct Coordinate: Hashable {
    let x: Int
    let y: Int
}

class Solution {

    
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        var rowDict: [Int: Set<Character>] = [:]
        var colDict: [Int: Set<Character>] = [:]
        var squareDict: [Coordinate: Set<Character>] = [:]

        for r in 0..<9 {
            for c in 0..<9 {

                if board[r][c] == "." {
                    continue
                }

                // check row
                if rowDict[r]?.contains(board[r][c]) == true {
                    return false
                }

                // check column
                if colDict[c]?.contains(board[r][c]) == true {
                    return false
                }

                // check squares
                let squareKey = Coordinate(x: r / 3, y: c / 3) 

                if squareDict[squareKey]?.contains(board[r][c]) == true {
                    return false
                }

                rowDict[r, default:[]].insert(board[r][c])
                colDict[c, default:[]].insert(board[r][c])
                squareDict[squareKey, default:[]].insert(board[r][c])

            }

        }

        return true
    }
}
