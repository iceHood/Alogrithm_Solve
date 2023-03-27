//
//class Solution {
//    func grayCode(_ n: Int) -> [Int] {
//        var answer = [UInt32]()
//        answer.append(0)
//        for i in 0..<n {
//            var size = answer.count
//            for t in stride(from: size - 1, through: 0, by: -1) {
//                answer.append(answer[t] | 1<<i)
//            }
//        }
//        return answer.map { Int($0) }
//    }
//}
//
//func pad(_ string : String, _ toSize: Int) -> String {
//  var padded = string
//  for _ in 0..<(toSize - string.count) {
//    padded = "0" + padded
//  }
//    return padded
//}
//print(Solution().grayCode(4).map{pad(String($0,radix: 2), 4)})
//print([0,1,3,2,6,7,5,4,12,13,15,14,10,11,9,8].map{pad(String($0,radix: 2), 4)})
//print(Solution().grayCode(4).sorted())
//print([0,1,3,2,6,7,5,4,12,13,15,14,10,11,9,8].sorted())
//
