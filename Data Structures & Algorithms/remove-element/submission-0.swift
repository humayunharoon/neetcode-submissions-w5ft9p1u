class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        // empty array check
        guard nums.count > 0 else {
            return 0
        }

        var nextWrite = 0

        for i in stride(from:0, to:nums.count, by:1) {
            
            let currValue = nums[i]

            if currValue == val {
                continue
            } else {
                nums[nextWrite] = currValue
                nextWrite += 1
            }
        }

        return nextWrite
    }
}
