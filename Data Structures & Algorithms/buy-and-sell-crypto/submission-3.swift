class Solution {
    func maxProfit(_ prices: [Int]) -> Int {

        var maxProfit = 0
        var minBuyPoint = Array(repeating:Int.max, count:prices.count)

        for i in 1..<prices.count {
            minBuyPoint[i] = min(prices[i - 1], minBuyPoint[i - 1])
        }

        for i in 1..<prices.count {
            maxProfit = max(prices[i] - minBuyPoint[i], maxProfit)
        }

        return maxProfit
    }
}
