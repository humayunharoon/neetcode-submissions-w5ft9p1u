class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var store: [Int: [Int]] = [:]
        var output: [Int] = []

        // parse input
        for i in 0..<nums.count {
            let numKey = nums[i]

            store[numKey, default:[]].append(i)
        }

        // find answer
        for i in 0..<nums.count {
            let delta = target - nums[i]

            if let pairArray = store[delta] {
                let secondVal = pairArray[0]
                if secondVal == i {continue}

                output.append(min(i, secondVal))
                output.append(max(i, secondVal))
                break
            }
        }

        return output
    }
}
