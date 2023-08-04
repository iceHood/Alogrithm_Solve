//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var buy1 = Int.max, buy2 = Int.max
//        var sell1 = 0, sell2 = 0
//        for price in prices {
//            buy1 = min(buy1, price)
//            sell1 = max(sell1, price-buy1)
//            buy2 = min(buy2, price-sell1)
//            sell2 = max(sell2, price-buy2)
//        }
//        return sell2
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
//prices = [3,3,5,0,0,3,1,4]
//print(Solution().maxProfit(prices))
//
