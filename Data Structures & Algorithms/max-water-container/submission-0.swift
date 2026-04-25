class Solution {
    func maxArea(_ heights: [Int]) -> Int {

        var maxVol = 0

        for i in 0..<heights.count {
            for j in i+1..<heights.count {

                var vol = min(heights[i], heights[j])
                vol = vol * (j - i)
                maxVol = max(vol, maxVol)
            }
        }
        
        return maxVol
    }
}
