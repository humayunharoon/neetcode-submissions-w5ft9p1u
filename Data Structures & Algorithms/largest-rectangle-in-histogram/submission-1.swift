class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {

        var stack: [(index: Int, height:Int)] = []
        var maxArea = 0

        for (index, height) in heights.enumerated() {
            var start = index

            while !stack.isEmpty && height < stack[stack.count - 1].height {
                let popped = stack.removeLast()
                maxArea = max(maxArea, (index - popped.index) * popped.height)
                start = popped.index
            }

            stack.append((start, height))
        }

        while !stack.isEmpty {
            let popped = stack.removeLast()
            maxArea = max(maxArea, popped.height * (heights.count - popped.index))
        }

        return maxArea
    }
}
