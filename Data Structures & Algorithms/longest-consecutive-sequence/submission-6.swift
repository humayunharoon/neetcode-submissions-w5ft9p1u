class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {

        var dict: [Int: Bool] = [:]
        var answer = 0

        // populating dict
        for num in nums {
            dict[num] = true
        }

        // traverse dict
        while let start = dict.keys.first {

            // empty the current key
            dict[start] = nil

            var count = 1
            var nextVal = start + 1
            var prevVal = start - 1

            // go forward
            while dict[nextVal] != nil {
                dict[nextVal] = nil
                count += 1
                nextVal += 1
            }

            // go back
            while dict[prevVal] != nil {
                dict[prevVal] = nil
                count += 1
                prevVal -= 1
            }

            // end loop
            if count > answer {
                answer = count
            }

        }


        return answer
    }
}
