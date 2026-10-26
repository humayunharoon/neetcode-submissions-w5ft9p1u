class Solution {
    func maxArea(_ heights: [Int]) -> Int {

        var maxVol = 0
        var a = 0
        var b = heights.count - 1
        let len = heights.count
       
        while a < b {
            let height = min(heights[a],heights[b])
            let volume = height * (b - a)
            maxVol = max(volume, maxVol)

            if heights[a] < heights[b] {
                a += 1
            } else {
                b -= 1
            }
        }

        return maxVol
    }
}
