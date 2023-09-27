class Solution {
    func isHappy(_ n: Int) -> Bool {
        var n = n
        var haveDone: Set<Int> = []
        while n != 1 {
            var temp: [Int] = []
            while n != 0 {
                temp.append(n % 10)
                n /= 10
            }
            n = temp.reduce(0) {$0 + $1 * $1}
            if haveDone.contains(n) {
                return false
            } else {
                haveDone.insert(n)
            }
        }
        return true
    }
}
