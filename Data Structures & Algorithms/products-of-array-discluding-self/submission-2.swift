class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {

        let length = nums.count
        var output: [Int] = Array(repeating:1, count: length)
        var left = Array(repeating:1, count: length)
        var right = Array(repeating:1, count: length)

        // process left
        for i in stride(from:0, to: length, by: 1) {
            if i == 0 {
                continue
            }
            left[i] = nums[i - 1] * left[i - 1]
        }

        // process right
        for i in stride(from:length - 2, through: 0, by: -1) {
            right[i] = nums[i + 1] * right[i + 1]
        }

        // process answer
        for i in stride(from:0, to: length, by: 1) {
            output[i] = left[i] * right[i]
        }

        return output
    }
}
