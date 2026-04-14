class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {

        guard arr.count > 0 else {
                return [-1]
            }

        var maxValue = -1
        var output = arr

        for i in stride(from: arr.count-1, through:0, by:-1) {
           // edge case to start with
           if (i == arr.count-1) {
            output[i] = -1
           } else {
            output[i] = max(output[i+1], arr[i+1] )
           }
        }
        return output
    }   

}