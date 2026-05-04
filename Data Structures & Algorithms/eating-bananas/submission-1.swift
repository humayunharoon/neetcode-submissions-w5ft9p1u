class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {

        var l = 1
        var r = piles.max()!

        var result = piles.max()!

        while l <= r {
            var k = (l + r) / 2
            var hours = 0

            for i in 0..<piles.count {
                hours += Int(ceil(Double(piles[i]) / Double(k)))
            } 

            if hours <= h {
                result = min(result, k)
                r = k - 1
            } else {
                l = k + 1
            }
        }

        return result
    }   
}
