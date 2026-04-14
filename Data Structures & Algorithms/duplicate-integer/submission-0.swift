class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {

        var hasDuplicate = false
        var dict: [Int:Int] = [:]

        for i in nums {

            if dict[i] == nil {
                dict[i] = i
            } else {
                hasDuplicate = true
            }

            if hasDuplicate == true {
                break
            }
        }

        return hasDuplicate
    }
}
