class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var i: Int = 0
        var j: Int 
        var k: Int
        let input = nums.sorted()

        var answer: [[Int]] = []

        let len = input.count

        while i < input.count - 2 {
            if i > 0 && input[i - 1] == input[i] {
                i += 1 
                continue
            }

            j = i + 1
            k = len - 1

            while j < k {
                if (j > i + 1) && input[j - 1] == input[j] {
                    j += 1
                    continue      
                }

                if (k < len - 1) && input[k + 1] == input[k] {
                    k -= 1
                    continue 
                }
                
                let sum = input[i] + input[j] + input[k]

                if sum == 0 {
                    answer.append([input[i],input[j],input[k]])
                    j += 1
                    k -= 1
                    continue
                }

                if sum > 0 {
                    k -= 1
                } else {
                    j += 1
                }
            }

            i += 1
        }

        return answer
    }
}
