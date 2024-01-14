
func solve() {
    func findPattern(str: [Character]) -> [Int]{
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
    
    var str = [Character]()
    while true {
        str = Array(readLine()!)
        if str == ["."] { break }
        let pattern = findPattern(str: str)
        print(pattern)
        let result = str.count - pattern.last!
        if str.count % result != 0 {
            print(1)
        } else {
            print(str.count / result)
        }
    }
}

solve()
