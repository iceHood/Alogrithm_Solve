class Solution {

    enum Pattern {
        case char(value: Character)
        case question
        case star
    }

    func isMatch(_ s: String, _ p: String) -> Bool {

        var arr: [Pattern] = p.map { ch in
            if "?" == ch {
                return .question
            } else if "*" == ch {
                return .star
            } else {
                return .char(value: ch)
            }
        }

        if s.count == 0 && arr.count == 0 {
            return true
        } else if s.count == 0 || arr.count == 0 {
            var isOnlyStar = s.count < arr.count
            for pt in arr {
                if case .star = pt {
                    continue
                } else {
                    isOnlyStar = false
                    break
                }
            }
            return isOnlyStar
        }

        var strIdx = 0
        var patternIdx = 0
        var starIdx: Int?
        var starStrIdx = 0
        var char: Character
        var pattern: Pattern

        while strIdx < s.count {
            char = s[s.index(s.startIndex, offsetBy: strIdx)]
            pattern = arr[patternIdx < arr.count ? patternIdx : arr.count - 1]
            if case .char(let value) = pattern, value == char, patternIdx < arr.count {
                patternIdx += 1
                strIdx += 1
                continue
            } else if case .question = pattern, patternIdx < arr.count {
                patternIdx += 1
                strIdx += 1
                continue
            }

            if case .star = pattern, patternIdx < arr.count {
                starIdx = patternIdx
                patternIdx += 1
                starStrIdx = strIdx
                continue
            }

            if let starIdx = starIdx {
                patternIdx = starIdx + 1
                starStrIdx += 1
                strIdx = starStrIdx
                continue
            }

            return false
        }

        while patternIdx < arr.count, case .star = arr[patternIdx]{
            patternIdx += 1
        }

        return patternIdx == arr.count
    }
}
print(Solution().isMatch("a", ""))

/* MYFUCKINGSOLUTION
class Solution {

    enum Pattern {
        case char(value: Character)
        case question
        case star
    }

    func isMatch(_ s: String, _ p: String) -> Bool {

        var arr: [Pattern] = p.map { ch in
            if "?" == ch {
                return .question
            } else if "*" == ch {
                return .star
            } else {
                return .char(value: ch)
            }
        }

        if s.count == 0 && arr.count == 0 {
            return true
        } else if s.count == 0 || arr.count == 0 {
            var isOnlyStar = s.count < arr.count
            for pt in arr {
                if case .star = pt {
                    continue
                } else {
                    isOnlyStar = false
                    break
                }
            }
            return isOnlyStar
        }

        var strIdx = 0
        var patternIdx = 0
        var isNowStar = false
        var char = s[s.index(s.startIndex, offsetBy: strIdx)]
        var pattern = arr[patternIdx]

        func starPattern() {
            switch pattern {
            case .char(let ch):
                while char != ch {
                    strIdx += 1
                    guard strIdx < s.count else { return }
                    char = s[s.index(s.startIndex, offsetBy: strIdx)]
                }
            case .question:
                if patternIdx == arr.count - 1 {
                    strIdx = max(s.count-1, strIdx)
                }
            case .star:
                break
            }
            isNowStar = false
        }

        while patternIdx < arr.count && strIdx < s.count {
            char = s[s.index(s.startIndex, offsetBy: strIdx)]
            pattern = arr[patternIdx]
            if isNowStar {
                starPattern()
            }
            switch pattern {
            case .char(value: let ch):
                if char != ch {
                    return false
                }
                strIdx += 1
            case .question:
                strIdx += 1
            case .star:
                isNowStar = true
            }
            patternIdx += 1
        }

        if isNowStar && patternIdx < arr.count {
            starPattern()
        } else if isNowStar {
            return true
        }

        while patternIdx < arr.count {
            if case .star = arr[patternIdx] {
                patternIdx += 1
            } else {
                break
            }
        }

        return strIdx == s.count && patternIdx == arr.count
    }
}

Solution().isMatch("abcdefg", "*?")
*/
