class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        func recur(_ start: Int) {
            if temp.count == k {
                result.append(temp)
            } else {
                guard start <= n else {return}
                for i in start...n {
                    temp.append(i)
                    recur(i + 1)
                    temp.popLast()
                }
            }
        }
        recur(1)
        return result
    }
}

//var  n = 4, k = 2
//var  n = 1, k = 1
var  n = 14, k = 10
print(Solution().combine(n, k))
