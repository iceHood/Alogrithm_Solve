class Solution {
    func isValid(_ s: String) -> Bool {

        var smallBracket = 0
        var middleBracket = 0
        var bigBracket = 0
        var lastOpen: [Character] = []

        for ch in s {
            switch ch {
            case "(":
                smallBracket += 1
                lastOpen.append(ch)
            case ")":
                smallBracket -= 1
                guard let last = lastOpen.last else {break}
                if last == "(" {
                    _ = lastOpen.popLast()
                    break
                } else {
                    return false
                }
            case "[":
                middleBracket += 1
                lastOpen.append(ch)
            case "]":
                middleBracket -= 1
                guard let last = lastOpen.last else {break}
                if last == "[" {
                    _ = lastOpen.popLast()
                    break
                } else {
                    return false
                }
            case "{":
                bigBracket += 1
                lastOpen.append(ch)
            case "}":
                bigBracket -= 1
                guard let last = lastOpen.last else {break}
                if last == "{" {
                    _ = lastOpen.popLast()
                    break
                } else {
                    return false
                }
            default:
                break
            }
            if smallBracket < 0 || middleBracket < 0 || bigBracket < 0 {
                return false
            }
        }
        if smallBracket == 0 && middleBracket == 0 && bigBracket == 0 {
            return true
        } else {
            return false
        }
    }
}

print(Solution().isValid("([)]"))
