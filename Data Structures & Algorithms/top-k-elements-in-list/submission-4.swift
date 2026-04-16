class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {

        var dict: [Int: Int] = [:]
        var freqBucket: [[Int]] = Array(repeating:[], count:nums.count + 1) 

        var result: [Int] = []

        for number in nums {
            dict[number, default:0] += 1
        }

        for (number,frequency) in dict {
            freqBucket[frequency].append(number)
        }

        for freq in stride(from:nums.count, through:0, by:-1) {

            for value in freqBucket[freq] {
                result.append(value)
                if (result.count == k) {
                    return result
                }
            }
        }

        return result

        // The solution below works, but lets write the better solution above

        // var dict: [Int: Int] = [:]

        // // store counts/frequency of all unique values in nums
        // // T:O(n) S:O(m), where m is the number if unique elements
        // for number in nums {
        //     dict[number, default: 0] += 1 
        // }

        // // T:mlogm, where m is # of unieue elements
        // // S:m
        // let sortedKeys = dict.sorted { $0.value > $1.value }.map { $0.key }
        // return Array(sortedKeys.prefix(k))

    }
}
