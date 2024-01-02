
func solve() {
    let N = Int(readLine()!)!
    
    if N < 4 {
        print(0)
        return
    }
    
    var combi = [[Int]](repeating: [Int](repeating: -1, count: 53), count: 53)
    
    func getCombination(_ n: Int, _ r: Int) -> Int {
        if n == 0 { return 1 }
        if n == r { return 1 }
        if r == 0 { return 1 }
        if r == 1 { return n }
        if n-r == 1 { return n }
        
        if combi[n][r] > 0 { return combi[n][r] }
        
        combi[n][r] = (getCombination(n-1, r) + getCombination(n-1, r-1)) % 10007
        
        return combi[n][r]
    }
    
    var result = 0
    
    for i in stride(from: 4, through: N, by: 4) {
        if i / 4 % 2 == 1 {
            result += getCombination(13, i/4) * getCombination(52-i, N-i)
        } else {
            result -= getCombination(13, i/4) * getCombination(52-i, N-i)
        }
        result %= 10007
    }

    if result < 0 { result += 10007 }
    
    print(result)
}

solve()
