struct BoxIndex: Hashable {
    let row: Int
    let col: Int
}

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var rows: [Int: Set<Character>] = [:]
        var cols: [Int: Set<Character>] = [:]
        var squares: [BoxIndex: Set<Character>] = [:]

        for r in 0..<9 {
            for c in 0..<9 {
                
                let value = board[r][c]
                if value == "." {
                    continue
                }

                // check row
                var rowSet = rows[r, default:Set<Character>()]
                if rowSet.contains(value) {
                    return false
                } else {
                    rowSet.insert(value)
                    rows[r] = rowSet
                }

                // check col
                var colSet = cols[c, default:Set<Character>()]
                if colSet.contains(value) {
                    return false
                } else {
                    colSet.insert(value)
                    cols[c] = colSet
                }

                // check square
                let indexTuple = BoxIndex(row: r / 3, col: c / 3)
                var squareSet = squares[indexTuple, default:Set<Character>()]
                if squareSet.contains(value) {
                    return false
                } else {
                    squareSet.insert(value)
                    squares[indexTuple] = squareSet
                }
            }
        }

        return true
    }
}
