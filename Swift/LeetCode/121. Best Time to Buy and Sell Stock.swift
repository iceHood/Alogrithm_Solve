class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var base = prices[0]
        var answer = 0
        for i in 1..<prices.count {
            if prices[i] < base {
                base = prices[i]
            }
            answer = max(prices[i]-base, answer)
        }
        return answer
    }
}

var prices = [7,1,5,3,6,4]
print(Solution().maxProfit(prices))
prices = [7,6,4,3,1]
print(Solution().maxProfit(prices))
