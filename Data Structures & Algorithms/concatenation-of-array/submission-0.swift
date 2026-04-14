class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {

        var ans = nums
        ans.append(contentsOf: nums)

        return ans
    }
}
