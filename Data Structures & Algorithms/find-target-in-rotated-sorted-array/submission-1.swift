class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

        var l = 0
        var r = nums.count - 1
        
        var ans = -1

        while l <= r {

            let m = (l + r) / 2

            if target == nums[m] { return m }
            
            if nums[l] <= nums[m] {
                // left sorted
                if target < nums[m] && target >= nums[l] {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else {
                // right sorted
                if target > nums[m] && target <= nums[r] {
                    l = m + 1
                } else {
                    r = m - 1
                }
            }
        }

        return ans
    }
}
