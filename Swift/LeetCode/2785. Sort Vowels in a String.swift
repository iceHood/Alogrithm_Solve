class Solution {
    func sortVowels(_ s: String) -> String {
        let s = Array(s)
        var t = [Character](repeating: " ", count: s.count)
        var vowel = [Character : Int]()
        for i in 0..<s.count {
            switch s[i] {
            case "a", "A", "e", "E", "i", "I", "o", "O", "u", "U":
                vowel[s[i]] = (vowel[s[i]] ?? 0) + 1
            default:
                t[i] = s[i]
            }
        }
        var idx = 0
        vowel.sorted(by: {$0.key <= $1.key}).forEach { key, value in
            for _ in 0..<value {
                while t[idx] != " " { idx += 1}
                t[idx] = key
            }
        }
        return String(t)
    }
}
