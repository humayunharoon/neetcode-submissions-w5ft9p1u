class Solution {
    func findMin(_ nums: [Int]) -> Int {

        var l = 0
        var r = nums.count - 1

        var leftVal = nums[l]
        var rightVal = nums[r]

        var minVal = 1001

        while l <= r {

            let center = (l + r) / 2
            let centerVal = nums[center]

            if centerVal > rightVal {
                l = center + 1
            } else {
                minVal = min(minVal, centerVal)
                r = center - 1
            }
        }
        return minVal
    }
}
