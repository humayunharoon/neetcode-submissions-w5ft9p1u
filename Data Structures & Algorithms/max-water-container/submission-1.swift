class Solution {
    func maxArea(_ heights: [Int]) -> Int {

        var maxVol = 0
        var left = 0
        var right = heights.count - 1

        while left < right {
            let vol = min(heights[left], heights[right]) * (right - left)
            if heights[left] <= heights[right] {
                left += 1
            } else {
                right -= 1
            }
            maxVol = max(vol, maxVol)
        }

        return maxVol
    }
}
