class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        columnTitle.unicodeScalars.map { Int($0.value - 64) }.reduce(0) { partial, arg in
            partial * 26 + arg
        }
    }
}
