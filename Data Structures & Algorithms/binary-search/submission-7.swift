class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

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
