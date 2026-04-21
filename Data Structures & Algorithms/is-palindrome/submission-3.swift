class Solution {
    func isPalindrome(_ s: String) -> Bool {

        let filtered = Array(s.lowercased().filter { $0.isASCII && ($0.isNumber || $0.isLetter) })

        var left = 0
        var right = filtered.count - 1

        while left < right {
            if filtered[left] == filtered[right] {
                left += 1
                right -= 1
            } else {
                return false
            }
        }
        return true
    }
}
