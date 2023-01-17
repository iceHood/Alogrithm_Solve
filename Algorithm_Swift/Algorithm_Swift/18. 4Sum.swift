//class Solution {
//    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
//        let numbers = nums.sorted()
//        var answer: Set<[Int]> = []
//
//        for i in 0..<numbers.count {
//            for t in i+1..<numbers.count {
//                var left = t+1
//                var right = numbers.count - 1
//                while left < right {
//                    let now = numbers[i] + numbers[t] + numbers[left] + numbers[right]
//                    if now == target {
//                        answer.insert([numbers[i], numbers[t], numbers[left], numbers[right]])
//                        left += 1
//                    } else if now < target {
//                        left += 1
//                    } else {
//                        right -= 1
//                    }
//                }
//            }
//        }
//        return Array(answer)
//    }
//}
//
//print(Solution().fourSum([-3,-2,-1,0,0,1,2,3], 0))
//
////[[-2,-1,0,3],[-3,0,0,3],[-3,0,1,2],[-3,-2,2,3],[-1,0,0,1],[-2,0,0,2],[-3,-1,1,3]]
////[[-3,-2,2,3],[-3,-1,1,3],[-3,0,0,3],[-3,0,1,2],[-2,-1,0,3],[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
////[[-2,-1,1,2]]
