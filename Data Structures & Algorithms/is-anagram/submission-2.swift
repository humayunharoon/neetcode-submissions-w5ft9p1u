class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if (s.count == 0 && t.count == 0) {
            return true
        }

        if s.count == 0 || t.count == 0 {
            return false
        }

        if s.count != t.count {
            return false
        }

        var dictS: [Character: Int] = [:]
        var dictT: [Character: Int] = [:]

        for i in s {
            dictS[i, default:0] += 1
        }

        for i in t {
            dictT[i, default:0] += 1
        }

        if dictS == dictT {
            return true
        } else {
            return false
        }
    }
}
