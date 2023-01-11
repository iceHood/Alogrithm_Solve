//class Solution {
//
//    let symbols: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
//
//    func romanToInt(_ s: String) -> Int {
//        var answer = 0
//        var prev = 1001
//        for ch in s {
//            guard let temp = symbols[ch] else {continue}
//            if prev < temp {
//                answer += temp - 2 * prev
//                prev = temp - prev
//            } else {
//                answer += temp
//                prev = temp
//            }
//        }
//        return answer
//    }
//}
//
//print(Solution().romanToInt("MCMXCIV"))
