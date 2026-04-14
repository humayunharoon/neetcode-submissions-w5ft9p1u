class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        // There are no checks because constaints list that there is only
        // on valid answer.
        // We should check for empty input, invalid input or invalid
        // answer, such as i == j

        var dict :[Int:Int] = [:]

        for i in 0..<nums.count {

            let currentValue = nums[i]

            if let index = dict[currentValue] {
                return [index, i]
            }

            let difference = target - currentValue
            dict[difference] = i
        }
        
        // dummy answer to silence warning. Constraints comfirm answer exists.
        return [0,0]
    }
}
