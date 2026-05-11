class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {

        var slow = nums[0]
        var fast = nums[nums[0]]

        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }

        var slow2 = 0

        while slow != slow2 {
            slow = nums[slow]
            slow2 = nums[slow2]
        }

        return slow2
        
    }
}
