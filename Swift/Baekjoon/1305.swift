func solve() {
    let L = Int(readLine()!)!
    let str = Array(readLine()!)
    
    func findPattern(pattern: [Character]) -> [Int] {
        var arr = [Int](repeating: 0, count: L+1)
        var i = -1
        var j = 0
        arr[j] = i
        while j < L {
            if i == -1 || pattern[i] == pattern[j] {
                i += 1
                j += 1
                arr[j] = i
            } else {
                i = arr[i]
            }
        }
        return arr
    }
    
    let pattern = findPattern(pattern: str)
    print(L-pattern[L])
    
}


solve()
