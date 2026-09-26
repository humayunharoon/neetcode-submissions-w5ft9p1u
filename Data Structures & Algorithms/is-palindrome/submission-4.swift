class Solution {
    func isPalindrome(_ s: String) -> Bool {

        var str = String(s.filter { $0.isLetter || $0.isNumber})
        str = str.lowercased()

        let strArray = Array(str)

        var left = 0
        var right = strArray.count - 1

        while left <= right {
            if strArray[left] != strArray[right] {
                return false
            }
            left += 1
            right -= 1
        }
    
        return true
    }
}
