class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var maxLen = 0
        let str = Array(s)

        for i in 0..<str.count {

            var set: Set<Character> = []
            for j in i..<str.count {
                if set.contains(str[j]) {
                    break
                } else {
                    set.insert(str[j])
                }
            }
            maxLen = max(maxLen, set.count)
        }
        
        return maxLen
    }
}
