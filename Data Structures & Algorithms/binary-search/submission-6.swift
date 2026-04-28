class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
            return -1  
        }
            

        var l = 0
        var r = nums.count - 1
        var mid = 0

        while l <= r {
            mid = (r + l) / 2
            let midNum = nums[mid]

            if midNum == target {
                return mid
            } else if target > midNum {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return -1
    }
}
