

func solve() {
    func makePattern(str: [Character]) -> [Int] {
        var pattern = [Int](repeating: 0, count: str.count+1)
        var i = -1
        var j = 0
        pattern[j] = i
        while j < str.count {
            if i == -1 || str[i] == str[j] {
                i += 1
                j += 1
                pattern[j] = i
            } else {
                i = pattern[i]
            }
        }
        return pattern
    }
    let str = Array(readLine()!)
    var result = 0
    
    for i in 0..<str.count {
        let pattern = makePattern(str: Array(str[i...]))
        result = max(result, pattern.max()!)
    }
    print(result)
}

solve()
