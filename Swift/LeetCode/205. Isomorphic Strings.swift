class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var dict: [Character: Character] = [:]
        var dict2: [Character: Character] = [:]
        let s = Array(s)
        let t = Array(t)
        for i in 0..<s.count {
            let sch = s[i]
            let tch = t[i]
            if dict[sch] == nil {
                dict[sch] = tch
                if dict2[tch] == nil {
                    dict2[tch] = sch
                } else {
                    if dict2[tch] != sch {
                        return false
                    }
                }
            } else {
                if dict[sch] != tch {
                    return false
                }
            }
        }
        return true
    }
}
