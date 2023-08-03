//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var i = 0, buy = 0, sell = 0, profit = 0, N = prices.count-1
//        while i < N {
//            while i < N && prices[i+1] <= prices[i] { i+=1 }
//            buy = prices[i]
//            while i < N && prices[i+1] > prices[i] { i+=1 }
//            sell = prices[i]
//            profit += sell - buy
//        }
//        return profit
//    }
//}
//
//var prices = [7,1,5,3,6,4]
//print(Solution().maxProfit(prices))
//prices = [1,2,3,4,5]
//print(Solution().maxProfit(prices))
//prices = [7,6,4,3,1]
//print(Solution().maxProfit(prices))
//prices = [1,2,1,4,9,10]
//print(Solution().maxProfit(prices))
