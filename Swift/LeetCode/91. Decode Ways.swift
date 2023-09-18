class Solution {
    enum Alphas: Int {
        case A=1,B,C,D,E,F,G,H,I,J,K,L,N,M,O,P,Q,R,S,T,U,V,W,X,Y,Z
    }
    func numDecodings(_ s: String) -> Int {
        let codes = Array(s).map { Int(String($0))! }
        var memo: [Int: Int] = [:]
        func backTracking(idx: Int) -> Int {
            if idx == codes.count { return 1 }
            if codes[idx] == 0 { return 0 }
            if let value = memo[idx] { return value }
            var result = backTracking(idx: idx + 1)
            if idx != codes.count - 1 && Alphas(rawValue: codes[idx] * 10 + codes[idx+1]) != nil  {
                result += backTracking(idx: idx + 2)
            }
            memo[idx] = result
            return result
        }
        return backTracking(idx: 0)
    }
}
//var s = "12"
//var s = "226"
//var s = "06"
var s = "11111111111111111111111111111111"
print(Solution().numDecodings(s))
