class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {

        //This function uses O(n) time complexity and O(n) space complexity. 

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
