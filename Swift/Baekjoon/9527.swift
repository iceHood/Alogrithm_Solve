//
//let AB = readLine()!.split(separator: " ").map { UInt(String($0))! }
//let (A, B) = (AB[0], AB[1])
//var dp = [UInt](repeating: 0, count: 55)
//
//func find(x: UInt, idx: Int = 54) -> UInt {
//    var temp = x & 1
//    var idx = idx
//    var x = x
//    while idx > 0 {
//        if x & (1 << idx) > 0 {
//            temp += dp[idx-1] + x - (1<<idx) + 1
//            x -= 1 << idx
//        }
//        idx -= 1
//    }
//    return temp
//}
//
//
//dp[0] = 1
//for i in 1..<55 {
//    dp[i] = dp[i-1] * 2 + (1 << i)
//}
//print(find(x: B) - find(x: A - 1))
