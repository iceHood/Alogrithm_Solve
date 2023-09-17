//class Solution {
//    func findRepeatedDnaSequences(_ s: String) -> [String] {
//        if s.count < 10 { return [] }
//        var answerSet: Set<String> = []
//        var set: Set<String> = []
//        let s = Array(s)
//        for i in 0...s.count-10 {
//            let temp = String(s[i..<i+10])
//            if set.contains(temp) {
//                answerSet.insert(temp)
//            } else {
//                set.insert(temp)
//            }
//        }
//        return Array(answerSet)
//    }
//}
