class Solution {
    func minWindow(_ s: String, _ t: String) -> String {

        let s = Array(s)
        let t = Array(t)
        var needDict: [Character: Int] = [:]
        var haveDict: [Character: Int] = [:]

        // update to increment freq if duplicates are to be counted
        for c in t {
            needDict[c, default: 0] += 1
        }

        // populate starter have dict
        for key in needDict.keys {
            haveDict[key, default:0] += 0
        }

        var l = 0
        var r = 0
        var minLen = Int.max
        var minString = ""
        let matchNeeded = needDict.count
        var matchHave = 0

        while r < s.count {

            let char = s[r]
            
            // check if char is needed
            if let value = haveDict[char] {
                // increment have
                haveDict[char] = value + 1
                // if matched, increment match
                if haveDict[char] == needDict[char]! {
                    matchHave += 1
                }

            }
            
            while matchHave == matchNeeded {
                if (r - l + 1) < minLen {
                    minLen = r - l + 1
                    minString = String(s[l...r])
                }

                let charL = s[l]
                // check if charL was in needed
                if let value = haveDict[charL] {
                    // unmatch occuring
                    if value == needDict[charL]! {
                        matchHave -= 1
                    }
                    haveDict[charL] = value - 1
                }
                l += 1
            } 
            r += 1
        }

        return minString
    }
}