//class Solution {
//    func divide(_ dividend: Int, _ divisor: Int) -> Int {
//        var quotient = 0
//        var dividend = dividend
//        var divisor = divisor
//        
//        if dividend == 0 {
//            return 0
//        }
//        
//        if dividend < 0 && divisor < 0 || dividend > 0 && divisor > 0 {
//            if dividend < 0 {
//                while dividend < 0 {
//                    if quotient == Int32.max {
//                        return quotient
//                    }
//                    var shift = 0
//                    while dividend >= divisor << shift { shift += 1}
//                    dividend -= divisor<<(shift-1)
//                    quotient += 1<<(shift-1)
//                }
//            } else {
//                while dividend > 0 {
//                    if quotient == Int32.max {
//                        return quotient
//                    }
//                    var shift = 0
//                    while dividend >= divisor << shift { shift += 1}
//                    dividend -= divisor<<(shift-1)
//                    quotient += 1<<(shift-1)
//                }
//            }
//        } else {
//            if dividend < 0 {
//                while dividend < 0 {
//                    if quotient == Int32.min {
//                        return quotient
//                    }
//                    var shift = 0
//                    while dividend <= divisor << shift { shift += 1}
//                    dividend += divisor<<(shift-1)
//                    quotient -= 1<<(shift-1)
//                }
//            } else {
//                while dividend > 0 {
//                    var shift = 0
//                    while dividend <= divisor << shift {
//                        shift += 1
//                        if divisor << shift >= 1 << 30 { break }
//                    }
//                    dividend += divisor<<(shift-1)
//                    if quotient - 1<<(shift-1) <= Int32.min {
//                        return quotient
//                    }
//                    quotient -= 1<<(shift-1)
//                }
//            }
//        }
//        return dividend == 0 ? quotient : quotient < 0 ? quotient + 1 : quotient - 1
//    }
//}
//
//print(Solution().divide(Int.max, 1))
