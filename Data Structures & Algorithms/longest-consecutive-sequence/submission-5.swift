
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {

        if nums.isEmpty {
            return 0
        }

        var set : Set<Int> = Set(nums)
        var output = 1

        for val in set {
            if !set.contains(val-1) {

                var length = 1
                while set.contains(val + length) {
                    length += 1
                }
                output = max(output, length)
            }
        }

        return output
    }
}
