//class Solution {
//    func isNumber(_ s: String) -> Bool {
//        var str = Array(s)
//        var idx = 0
//        var isThereIntegerPart = false
//        var isThereFractionalPart = false
//
//        // Check if there is a sign part
//        if str[idx] == "+" || str[idx] == "-" {
//            idx += 1
//            guard idx < str.count else {return false}
//        }
//
//        while idx < str.count {
//            // Check if there is a dot
//            if str[idx] == "." {
//                idx += 1
//                // Check if fractional part is valid
//                while idx < str.count {
//                    if str[idx] == "e" || str[idx] == "E" {
//                        break
//                    } else if "0"..."9" ~= str[idx] {
//                        isThereFractionalPart = true
//                        idx += 1
//                    } else {
//                        return false
//                    }
//                }
//            }
//
//            guard idx < str.count else {break}
//            // Check if there is a e or E
//            if str[idx] == "e" || str[idx] == "E" {
//                idx += 1
//                // Check if there aren't any integer or fration
//                if !isThereIntegerPart && !isThereFractionalPart {
//                    return false
//                } else {
//                    // Check if there is a sign
//                    guard idx < str.count else {return false}
//                    if str[idx] == "+" || str[idx] == "-" {
//                        idx += 1
//                        guard idx < str.count else {return false}
//                    }
//                    while idx < str.count {
//                        if "0"..."9" ~= str[idx] {
//                            idx += 1
//                        } else {
//                            return false
//                        }
//                    }
//                }
//            }
//            guard idx < str.count else {break}
//            // Check if this is digit or not
//            if "0"..."9" ~= str[idx] {
//                isThereIntegerPart = true
//                idx += 1
//            } else {
//                return false
//            }
//        }
//
//        return isThereIntegerPart || isThereFractionalPart
//    }
//}
//
//print("Should be valid")
//var valid = ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"]
//for num in valid {
//    print(Solution().isNumber(num), terminator: ", ")
//}
//print()
//print("Should be invalid")
//var invalid = ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53", "0e"]
//for num in invalid {
//    print(Solution().isNumber(num), terminator: ", ")
//}
