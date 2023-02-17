//class Solution {
//
//    var arr = [Int: Double]()
//
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        if arr[n] != nil {
//            return arr[n]!
//        }
//        print(#function, x, n)
//
//        if n == 0 {
//            return 1.0
//        } else if n == 1 {
//            return x
//        } else if n == -1 {
//            return 1 / x
//        }
//
//        let count = n / 2
//        arr[n] = myPow(x, count) * myPow(x, n - count)
//        return arr[n]!
//    }
//}
//
////var x = 2.0, n = 10
////var x = 2.10000, n = 3
////var x = 2.00000, n = -2
//var x = 1.0000, n = 2048
//print(Solution().myPow(x, n))
