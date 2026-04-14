class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        var dict :[Character: Int] = [:]

        if s.count != t.count {
            return false
        }

        for i in s {
            if dict[i] == nil {
                dict[i] = 1
            } else {
                let value = dict[i]!
                dict[i] = value + 1
            }
        }

        for i in t {
            if dict[i] == nil {
                return false
            } else {
                let value = dict[i]!
                dict[i] = value - 1
            }
        }

        for value in dict.values {
            if value != 0 {
                return false
            }
        }

        return true
    }
}
