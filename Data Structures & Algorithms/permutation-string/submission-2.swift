class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {

        guard s1.length <= s2.length else {
            return false
        }

        var dict1: [Character: Int] = [:]
        var dict2: [Character: Int] = [:]
        let s1 = Array(s1)
        let s2 = Array(s2)
        var matches = 0
        
        for c in "abcdefghijklmnopqrstuvwxyz" {
            dict1[c] = 0
            dict2[c] = 0
        }

        for c in Array(s1) {
            dict1[c]! += 1
        }

        // populate dict2
        for i in 0..<s1.count {
            let char = s2[i]
            dict2[char]! += 1
        }

        // find matches
        for key in dict1.keys {
            if dict1[key]! == dict2[key]! {
                matches += 1
            }
        }

        var l = 0
        var r = s1.count
        while r < s2.count {
            if matches == 26 { return true }

            let char = s2[r]
            dict2[char]! += 1
            if dict1[char]! == dict2[char]! { matches += 1 } // new match
            if dict1[char]! == (dict2[char]! - 1) { matches -= 1 } // fresh unmatch

            let leftChar = s2[l]
            dict2[leftChar]! -= 1
            if dict1[leftChar]! == dict2[leftChar]! { matches += 1 } // new match
            if dict1[leftChar]! == (dict2[leftChar]! + 1) { matches -= 1 } // fresh unmatch
            
            r += 1
            l += 1
        }
        
        return (matches == 26)
    }
}
