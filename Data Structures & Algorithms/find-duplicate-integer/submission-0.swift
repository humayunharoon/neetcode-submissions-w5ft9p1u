class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {

        var testSet: Set<Int> = []

        for i in stride(from:0, to: nums.count, by:1) {
            let number = nums[i]
            if testSet.contains(number) {
                return number
            } else {
                testSet.insert(number)
            }
        }

        return -1
    }
}
