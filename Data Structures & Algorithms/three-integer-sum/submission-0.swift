class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        // sort array
        let nums = nums.sorted()
        var output: [[Int]] = [] 

        // loop over main array to find a
        for (index, value) in nums.enumerated() {
            // caveat: if next a is same as previous, continue
            if index > 0 && value == nums[index - 1] {
                continue
            }

            var left = index + 1
            var right = nums.count - 1

            while left < right {
                if value + nums[left] + nums[right] > 0 {
                    right -= 1
                } else if value + nums[left] + nums[right] < 0 {
                    left += 1
                } else if value + nums[left] + nums[right] == 0 {
                    output.append([value, nums[left], nums[right]])
                    left += 1

                    while nums[left] == nums[left - 1] && left < right {
                        left += 1
                    }
                }
            }
        }

        return output
    }
}
