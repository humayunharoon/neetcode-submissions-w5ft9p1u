class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var maxLen = 0
        let str = Array(s) // This takes O(n). Using indexes makes it O(1)

        var l = 0
        var r = 0
        var set: Set<Character> = []

        // loop left and right pointer
        while r < str.count {
            let char = str[r]
            if set.contains(char) {
                var leftChar = str[l]

                while leftChar != char {
                    set.remove(leftChar)
                    l += 1
                    leftChar = str[l]
                }
                set.remove(leftChar)
                l += 1

            } else {
                // check if valid on each expansion and store max Len
                set.insert(char)
                maxLen = max(maxLen, set.count)
                // expand
                r += 1
            }
        }
        // loop until right reaches end
        return maxLen
    }
}
