class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {

        var dict: [Int: Int] = [:]
        var output: [Int] = []
        var freqArray: [[Int]] = Array(repeating: [], count: nums.count + 1)

        for x in nums {
            dict[x, default:0] += 1
        }

        for (key, value) in dict {
            freqArray[value].append(key)
        }

        var counter = nums.count
        while output.count < k {
            let array = freqArray[counter]
            for x in array {
                output.append(x)
            }
            counter -= 1
        }

        return output
    }
}
