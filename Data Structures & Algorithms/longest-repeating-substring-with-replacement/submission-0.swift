class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {

        let str = Array(s)
        var l = 0
        var r = 0
        var maxLen = 0
        var dict: [Character: Int] = [:]

        while r < str.count {
            let char = str[r]
            dict[char, default: 0] += 1

            var len = r - l + 1
            var maxFreq = dict.values.max()!

            if len - maxFreq <= k {
                maxLen = max(maxLen, len)
            } else {
                while l <= r {
                    let leftChar = str[l]
                    l += 1
                    dict[leftChar]! -= 1
                    maxFreq = dict.values.max()!
                    len = r - l + 1
                    if len - maxFreq <= k {
                        maxLen = max(maxLen, len)
                        break
                    }
                }
            }
            r += 1
        }

        return maxLen
    }

 }