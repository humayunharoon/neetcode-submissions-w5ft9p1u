class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {

        var dict: [Int: Int] = [:]

        // store counts/frequency of all unique values in nums
        // T:O(n) S:O(m), where m is the number if unique elements
        for number in nums {
            dict[number, default: 0] += 1 
        }

        // T:mlogm, where m is # of unieue elements
        // S:m
        let sortedKeys = dict.sorted { $0.value > $1.value }.map { $0.key }
        return Array(sortedKeys.prefix(k))

    }
}
