class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        var leftIndex = 0
        var rightIndex = numbers.count - 1

        while leftIndex < rightIndex {
            let sum = numbers[leftIndex] + numbers[rightIndex]
            
            if sum == target {
                break
            }

            if sum > target {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }

        return [leftIndex + 1, rightIndex + 1]
    }
}
