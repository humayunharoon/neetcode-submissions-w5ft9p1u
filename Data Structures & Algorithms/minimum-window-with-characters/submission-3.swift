class Solution {
    func minWindow(_ s: String, _ t: String) -> String {

        var mainDict: [Character: Int] = [:]
        var s = Array(s)
        var t = Array(t)
        var match = mainDict.count

        // populate main dict w/ chars to find O(n), O(n)
        for c in t {
            mainDict[c, default:0] += 1
        }
        
        match = mainDict.count

        var l = 0
        var r = 0
        var minLen = Int.max
        var minString = ""

        var dict = mainDict

        while r < s.count {
            
            var rChar = s[r]
            if let freq = dict[rChar] {
                dict[rChar] = freq - 1
                if dict[rChar] == 0 {
                    match -= 1
                }
            }

            while match == 0 {
                if (r - l + 1) < minLen {
                    minLen = r - l + 1
                    minString = String(s[l...r])
                }

                var lChar = s[l]
                if let freq = dict[lChar] {
                    if dict[lChar] == 0 {
                        match += 1
                    }
                    dict[lChar] = freq + 1
                }
                l += 1
            }
            r += 1
        } 
        
        return minString
    }
}