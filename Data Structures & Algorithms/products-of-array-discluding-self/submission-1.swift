class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {

        var prefix = Array(repeating:1, count:nums.count)
        var postfix = Array(repeating:1, count:nums.count)
        var output = Array(repeating:1, count:nums.count)

        // populate prefix
        prefix[0] = 1
        var prefixProd = 1
        for i in 1..<nums.count {
            prefixProd = prefixProd * nums[i - 1]
            prefix[i] = prefixProd
        }

        // populate postfix
        postfix[nums.count - 1] = 1
        var postfixProd = 1
        for i in stride(from: nums.count - 2, through:0, by: -1) {
            postfixProd = postfixProd * nums[i + 1]
            postfix[i] = postfixProd
        }

        // calculate output
        for i in 0..<nums.count {
            output[i] = prefix[i] * postfix[i]
        }
        
        return output
    }
}
