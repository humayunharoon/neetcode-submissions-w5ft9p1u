class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {

        if nums.isEmpty {
            return 0
        }

        let input = nums.sorted()
        var currentMax = 1
        var max = 1
        var value = input.first!

        for x in stride(from:1, to:input.count, by:1) {
            if input[x] - value == 0 {
                continue
            }

            if input[x] - value == 1 || input[x] - value == -1 {
                currentMax += 1
                value = input[x] 
            }

            if input[x] - value > 1 || input[x] - value < -1 {
                if max < currentMax {
                    max = currentMax
                }

                value = input[x]
                currentMax = 1
            }
        }

        if max < currentMax {
            max = currentMax
        }

        return max
    }
}
