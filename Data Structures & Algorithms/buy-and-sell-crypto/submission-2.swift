class Solution {
    func maxProfit(_ prices: [Int]) -> Int {

        var left = 0
        var right = 0

        var buyPrice = -1
        var profit = 0

        while left < prices.count, right < prices.count {
            buyPrice = prices[left]
            let sell = prices[right]

            if left == right {
                right += 1
                continue
            }

            if sell < buyPrice {
                left = right
                continue
            }

            var tempProfit = sell - buyPrice
            profit = max(profit, tempProfit)

            right += 1
        }

        return profit
    }
}
