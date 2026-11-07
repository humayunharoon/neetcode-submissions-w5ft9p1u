class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var left = 0
        var right = 0 
        var maxVal = 0
        let string = Array(s)
        var set = Set<Character>()

        while right < string.count{
            let char = string[right]
            if !set.contains(char) {
                let len = right - left + 1
                set.insert(char)
                right += 1
                maxVal = max(maxVal, len)
            } else {
                let leftChar = string[left]
                set.remove(leftChar)
                left += 1
            }
        }


        return maxVal
    }
}
