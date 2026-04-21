class Solution {
    func isPalindrome(_ s: String) -> Bool {

        let filtered = Array(s.lowercased().filter { $0.isASCII && ($0.isNumber || $0.isLetter) })
        //let isEven = filtered.count % 2

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

        // if isEven == 0 {
        //     var left = 0
        //     var right = filtered.count - 1

        //     while left < right {
        //         if filtered[left] == filtered[right] {
        //             left += 1
        //             right -= 1
        //         } else {
        //             return false
        //         }
        //     }
        // } else {
        //     var left = 0
        //     var right = filtered.count - 1
        //     let center = filtered.count / 2

        //     while left < center {
        //         if filtered[left] == filtered[right] {
        //             left += 1
        //             right -= 1
        //         } else {
        //             return false
        //         }
        //     }
        // }

        return true
    }
}
