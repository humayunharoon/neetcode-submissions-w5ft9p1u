class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        // return numbers
        var output: [[Int]] = []
        let nums = nums.sorted()
        
        for (i, val) in nums.enumerated() {
            if i > 0 && nums[i] == nums[i - 1] { continue }

            var l = i + 1
            var r = nums.count - 1

            while l < r {
                let sum = nums[l] + nums[r] + val
                if sum < 0 {
                    l += 1
                } else if sum > 0 {

                    r -= 1
                } else if sum == 0 {
                    let ans = [val, nums[l] , nums[r]]
                    output.append(ans)
                    l += 1
                    while nums[l] == nums[l - 1] && l < r {
                        l += 1
                    }
                }
            }
        }

        return output
    }
}
