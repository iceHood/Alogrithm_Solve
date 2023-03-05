//class Solution {
//    func plusOne(_ digits: [Int]) -> [Int] {
//        var plus = 1
//        var result = digits.reversed().reduce(into: [Int]()) { arr, num in
//            let result = num + plus
//            plus = result / 10
//            arr.append(result % 10)
//        }
//        if plus > 0 { result.append(plus) }
//        return result.reversed()
//    }
//}
//
////var digits = [4,3,2,1]
////var digits = [1,2,3]
//var digits = [9]
//print(Solution().plusOne(digits))
