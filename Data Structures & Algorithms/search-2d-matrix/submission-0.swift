class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {

        let rows = matrix.count

        var l = 0
        var r = rows - 1

        while l <= r {

            if l == r { break }

            let centerVal = l + ((r - l) / 2)
            let center = matrix[centerVal]
            if center[0] == target {
                return true
            } else if target > center[0] && target > center.last! {
                l = centerVal + 1
            } else if target > center[0] && target <= center.last! {
                l = centerVal
                r = centerVal
                break
            } else {
                r = centerVal - 1
            }
        }

        let row = matrix[l]
        l = 0
        r = row.count - 1

        while l <= r {

            let centerVal = l + ((r - l) / 2)
            if row[centerVal] == target {
                return true
            } else if target > row[centerVal] {
                l = centerVal + 1
            } else {
                r = centerVal - 1
            }
        }

        return false
    }
}
