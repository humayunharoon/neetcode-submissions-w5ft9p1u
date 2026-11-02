class Solution {
    func trap(_ height: [Int]) -> Int {

        var leftMax: [Int] = Array(repeating:0, count: height.count)
        var rightMax: [Int] = Array(repeating:0, count: height.count)
        var water = 0

        //populate max's
        leftMax[0] = 0
        var maxVal = 0
        for i in 1..<height.count {
            let value = height[i - 1]
            maxVal = max(maxVal, value)
            leftMax[i] = maxVal
        }

        rightMax[height.count - 1] = 0
        maxVal = 0
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            let value = height[i + 1]
            maxVal = max(maxVal, value)
            rightMax[i] = maxVal
        }

        for i in stride(from:1, to:height.count - 1, by:1) {

            let leftWall = leftMax[i]
            let rightWall = rightMax[i]
            
            var currWater = min(leftWall, rightWall) - height[i]
            if currWater > 0 {
                water += currWater
            }

        }

        return water
    }
}
