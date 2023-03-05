//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
////        -4, -1, -1, 0, 1, 2
////        ++-, +-0, 000, +--
//        var answer: Set<[Int]> = []
//        var indexing = [Int: Int]()
//        var positive = [Int]()
//        var negative = [Int]()
//        var zeroNum = 0
//        
//        for i in nums {
//            if i == 0 {
//                zeroNum += 1
//            } else {
//                if i > 0 {
//                    positive.append(i)
//                } else {
//                    negative.append(i)
//                }
//                indexing[-i] = 0
//            }
//        }
//        
//        // use positive
//        for i in 0..<positive.count {
//            for t in i+1..<positive.count {
//                if indexing[positive[i]+positive[t]] != nil {
//                    answer.insert([positive[i], positive[t], -(positive[i]+positive[t])].sorted())
//                }
//            }
//        }
//        // use negative
//        for i in 0..<negative.count {
//            for t in i+1..<negative.count {
//                if indexing[negative[i]+negative[t]] != nil {
//                    answer.insert([negative[i], negative[t], -(negative[i]+negative[t])].sorted())
//                }
//            }
//        }
//        
//        
//        if zeroNum > 0 {
//            if positive.count <= negative.count { // use positive
//                for i in 0..<positive.count {
//                    if indexing[positive[i]] != nil {
//                        answer.insert([positive[i], -positive[i], 0].sorted())
//                    }
//                }
//            } else { // use negative
//                for i in 0..<negative.count {
//                    if indexing[negative[i]] != nil {
//                        answer.insert([negative[i], -negative[i], 0].sorted())
//                    }
//                }
//            }
//        }
//        
//        if zeroNum >= 3 {
//            answer.insert([0, 0, 0])
//        }
//        
//        return Array(answer)
//    }
//}
//
//print(Solution().threeSum([0,0,0]))
