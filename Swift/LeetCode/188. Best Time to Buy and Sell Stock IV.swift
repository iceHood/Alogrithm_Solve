//class Solution {
//    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
//        var buy = [Int](repeating: .max, count: k+1)
//        var sell = [Int](repeating: 0, count: k+1)
//        for price in prices {
//            for i in 1...k {
//                buy[i] = min(buy[i], price-sell[i-1])
//                sell[i] = max(sell[i], price-buy[i])
//            }
//        }
//        return sell[k]
//    }
//}
//print(Int.random(in: 1...100))
//print((1...1000).map { _ in Int.random(in: 1...1000) })
