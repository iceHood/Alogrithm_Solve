//class Solution {
//    func restoreIpAddresses(_ s: String) -> [String] {
//        func isValid(num: String) -> Bool {
//            guard let number = Int(num) else { return false }
//            return number >= 0 && number <= 255 && num.count == String(number).count
//        }
//        guard s.count <= 12 else {return []} // IP should be less than equal to 12
//        guard Int(s) != nil else {return []} // contains none number
//
//        var str = Array(s)
//        var temp = ""
//        var answer = [String]()
//        func backTrack(count: Int, idx: Int) {
//            if count == 3 {
//                guard str.count - idx <= 3 && str.count - idx >= 1 else { return } // Remains should have 1~3 characters
//
//                let string = String(str[idx..<str.count])
////                print("temp:", temp+string)
//                guard isValid(num: string) else { return }
//                answer.append(temp+string)
//            } else {
//                var thisPart = ""
//                for i in 0...2 {
//                    guard idx + i < str.count else { break } // index boundary
//                    thisPart += "\(str[idx + i])"
//                    temp += "\(str[idx + i])"
//                    guard isValid(num: thisPart) else { break } // thisPart should be valid IP address
//                    temp += "."
////                    print("temp:", temp, "thisPart:",thisPart)
//                    backTrack(count: count + 1, idx: idx + i + 1)
//                    temp.popLast() // pull out "."
//                }
//                for _ in 0..<thisPart.count {
//                    temp.popLast() // pull out thisPart
//                }
//            }
//        }
//        backTrack(count: 0, idx: 0)
//        return answer
//    }
//}
//
////var s = "25525511135"
////var s = "0000"
//var s = "101023"
//print(Solution().restoreIpAddresses(s))
