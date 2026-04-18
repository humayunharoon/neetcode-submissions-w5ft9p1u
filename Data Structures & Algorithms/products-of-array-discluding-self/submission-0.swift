class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        
        var prefixArray : [Int] = Array(repeating:0, count:nums.count)
        var suffixArray : [Int] = Array(repeating:0, count:nums.count)
        var outputArray: [Int] = []

        var prefixProduct : Int = 1
        var suffixProduct : Int = 1

        //calculate prefix array
        prefixArray[0] = 1 
        for x in stride(from:1 ,to:nums.count, by:1){
            prefixProduct = prefixProduct * nums[x - 1]
            prefixArray[x] = prefixProduct
        }

        //calculate suffix array
        suffixArray[nums.count-1] = 1
        for x in stride(from:nums.count-2 ,through:0, by:-1){
            suffixProduct = suffixProduct * nums[x + 1]
            suffixArray[x] = suffixProduct
        }

        for x in stride(from:0, to:nums.count, by:1) {
            outputArray.append(prefixArray[x] * suffixArray[x])
        }

        return outputArray
    }
}
