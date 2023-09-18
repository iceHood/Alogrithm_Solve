class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        if columnNumber == 1 {
            return "A"
        } else if columnNumber == 2 {
            return "B"
        } else if columnNumber == 3 {
            return "C"
        } else if columnNumber == 4 {
            return "D"
        } else if columnNumber == 5 {
            return "E"
        } else if columnNumber == 6 {
            return "F"
        } else if columnNumber == 7 {
            return "G"
        } else if columnNumber == 8 {
            return "H"
        } else if columnNumber == 9 {
            return "I"
        } else if columnNumber == 10 {
            return "J"
        } else if columnNumber == 11 {
            return "K"
        } else if columnNumber == 12 {
            return "L"
        } else if columnNumber == 13 {
            return "M"
        } else if columnNumber == 14 {
            return "N"
        } else if columnNumber == 15 {
            return "O"
        } else if columnNumber == 16 {
            return "P"
        } else if columnNumber == 17 {
            return "Q"
        } else if columnNumber == 18 {
            return "R"
        } else if columnNumber == 19 {
            return "S"
        } else if columnNumber == 20 {
            return "T"
        } else if columnNumber == 21 {
            return "U"
        } else if columnNumber == 22 {
            return "V"
        } else if columnNumber == 23 {
            return "W"
        } else if columnNumber == 24 {
            return "X"
        } else if columnNumber == 25 {
            return "Y"
        } else if columnNumber == 26 {
            return "Z"
        } else if columnNumber > 26 {
            return convertToTitle((columnNumber-1) / 26) + convertToTitle((columnNumber-1) % 26 + 1)
        } else {
            return ""
        }
    }
}
for i in 1...Int.max {
    print(Solution().convertToTitle(i))
}
