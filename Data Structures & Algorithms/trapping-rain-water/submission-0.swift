class Solution {
    func trap(_ height: [Int]) -> Int {

        if height.count <= 1 { return 0 }

        var vol = 0
        var l = 0
        var r = 0

        for i in 1..<height.count - 1 {

            let currentHeight = height[i]
            var maxLeft = 0
            var maxRight = 0
            l = i - 1
            r = i + 1

            while l >= 0 {
                maxLeft = max(maxLeft, height[l])
                l -= 1
            }

            while r < height.count {
                maxRight = max(maxRight, height[r])
                r += 1
            }

            let maxPossibleContainer = min(maxLeft, maxRight)
            if maxPossibleContainer > currentHeight {
                vol += maxPossibleContainer - currentHeight
            }
        }
        return vol
    }
}
