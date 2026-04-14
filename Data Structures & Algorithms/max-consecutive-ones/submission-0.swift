
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {

        var max = 0
        var counter = 0

        for i in 0..<nums.count {

            if nums[i] == 1 {
                counter += 1
            } else {
                counter = 0
            }

            if counter > max {
                    max = counter
                }
        }
        
        return max
    }
}