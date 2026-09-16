class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var dict: [Int: Bool] = [:]

        for i in nums {
            if let _ = dict[i] {
                return true 
            } else {
                dict[i] = true
            }
        }

        return false
    }
}
