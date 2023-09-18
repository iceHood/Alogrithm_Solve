class Solution {
    func intToRoman(_ num: Int) -> String {
        var answer = ""
        var n = num
        while n > 0 {
            if 1000... ~= n {
                answer += "M"
                n -= 1000
            } else if 900..<1000 ~= n {
                answer += "CM"
                n -= 900
            } else if 500..<900 ~= n {
                answer += "D"
                n -= 500
            } else if 400..<500 ~= n {
                answer += "CD"
                n -= 400
            } else if 100..<400 ~= n {
                answer += "C"
                n -= 100
            } else if 90..<100 ~= n {
                answer += "XC"
                n -= 90
            } else if 50..<90 ~= n {
                answer += "L"
                n -= 50
            } else if 40..<50 ~= n {
                answer += "XL"
                n -= 40
            } else if 10..<40 ~= n {
                answer += "X"
                n -= 10
            } else if 9..<10 ~= n {
                answer += "IX"
                n -= 9
            } else if 5..<9 ~= n {
                answer += "V"
                n -= 5
            } else if 4..<5 ~= n {
                answer += "IV"
                n -= 4
            } else if 1..<4 ~= n {
                answer += "I"
                n -= 1
            }
        }
        return answer
    }
}


var ff = Solution()
print(ff.intToRoman(1994))
