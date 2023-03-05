//class Solution {
//    func getPermutation(_ n: Int, _ k: Int) -> String {
//        var numberList = Array(1...n)
//        var facto = numberList.reduce(into: [Int]()) { partialResult, num in
//            if num == 1 {
//                partialResult.append(1)
//            } else {
//                partialResult.append(partialResult.last! * num)
//            }
//        }
//        _ = facto.popLast() // not using last
//        var idx = k - 1
//        var result = ""
//        for i in facto.reversed() {
//            let numIdx = idx / i
//            idx %= i
//            result += "\(numberList.remove(at: numIdx))"
//        }
//        return result + "\(numberList.last!)"
//    }
//}
////var n = 3, k = 6
////var n = 4, k = 9
//var n = 3, k = 1
//print(Solution().getPermutation(n, k))
