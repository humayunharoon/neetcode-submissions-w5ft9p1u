class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        guard arr.count > 0 else {
            return [-1]
        }

        var output: [Int] = []

        for i in 0..<arr.count {
            if i == (arr.count - 1) {
                output.append(-1)
            } else {
                output.append(findLargestElement(arr, i+1)) 
            }
        }

        return output
    }

    func findLargestElement(_ arr: [Int], _ from: Int) -> Int {

        var largestElement = -1
        for i in stride(from: from, to: arr.count, by:1) {
            if arr[i] > largestElement {
                largestElement = arr[i]
            }
        }

        return largestElement
    }
}
