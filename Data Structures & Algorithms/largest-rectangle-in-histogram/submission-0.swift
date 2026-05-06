class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {

        // Brute force

        // fix Width
        var maxArea = heights.max()!

        // catch edge case, where there is no height at all
        if maxArea == 0 { return 0 }

        // At the start, max area also represents the biggest height
        for h in 1...maxArea {
            var width = 0

            for val in heights {
                if val >= h {
                    width += 1
                    maxArea = max(maxArea, width * h)
                } else {
                    width = 0
                }
            }
        }

        return maxArea
    }
}
