//class Solution {
//    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
//        var sumDict = numbers.enumerated().reduce(into: [Int: Int]()) { partialResult, arg in
//            partialResult[arg.element] = arg.offset + 1
//        }
//        for i in 0..<numbers.count {
//            if let answer = sumDict[target-numbers[i]] {
//                return [i+1, answer]
//            }
//        }
//        return [-1,-1]
//    }
//}
