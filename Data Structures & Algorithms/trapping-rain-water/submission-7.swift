class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count <= 1 { return 0 }

        var leftHighest = Array(repeating:0, count:height.count)
        var rightHighest = Array(repeating:0, count:height.count)
        var vol = 0
        var maxVal = 0

        for i in 0..<height.count {
            maxVal = max(maxVal, height[i])
            leftHighest[i] = maxVal
        }
        
        maxVal = 0
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            maxVal = max(maxVal, height[i])
            rightHighest[i] = maxVal
        }

        for i in 1..<height.count - 1 {
            let validWall = min(leftHighest[i - 1], rightHighest[i + 1])
            let x = height[i]
            if validWall > x {
                vol += (validWall - x)
            }
        }

        return vol
    }
}
