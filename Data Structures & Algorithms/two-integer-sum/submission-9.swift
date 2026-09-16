class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var dict: [Int: [Int]] = [:]

        for (index, num) in nums.enumerated() {
            dict[num, default:[]].append(index)
        }

        for (index, num) in nums.enumerated() {
            let find = target - num
            if let ans = dict[find] {
                for otherIndex in ans {
                    if otherIndex != index {
                        return [index, otherIndex]
                    }
                }

            }
        }
    
        return [0,0]
    }

}