class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        var n1 = Array(num1)
        var n2 = Array(num2)
        var answer = ""
        var adder = "0"
        var nums: [String] = []
        
        for (index, i) in n1.reversed().enumerated() {
            var str = ""
            str += [String](repeating: "0", count: index).joined()
            for t in n2.reversed() {
                let temp = Int(adder)! + Int(String(i))! * Int(String(t))!
                adder = String(temp / 10)
                str = String(temp % 10) + str
            }
            if adder != "0" {
                str = adder + str
            }
            adder = "0"
            nums.append(str)
        }
        
        var answerIdx = 0
        var numIdx = 0
        for number in nums {
            let number = Array(number)
            var calculate = ""
            answerIdx = answer.count - 1
            numIdx = number.count - 1
            while answerIdx >= 0 && numIdx >= 0 {
                let temp = Int(adder)! + Int(String(answer[answer.index(answer.startIndex, offsetBy: answerIdx)]))! + Int(String(number[numIdx]))!
                adder = String(temp / 10)
                calculate = String(temp % 10) + calculate
                answerIdx -= 1
                numIdx -= 1
            }
            
            while answerIdx >= 0 {
                let temp = Int(adder)! + Int(String(answer[answer.index(answer.startIndex, offsetBy: answerIdx)]))!
                adder = String(temp / 10)
                calculate = String(temp % 10) + calculate
                answerIdx -= 1
            }
            
            while numIdx >= 0 {
                let temp = Int(adder)! + Int(String(number[numIdx]))!
                adder = String(temp / 10)
                calculate = String(temp % 10) + calculate
                numIdx -= 1
            }
            if adder != "0" {
                calculate = adder + calculate
            }
            adder = "0"
            answer = calculate
        }
        return answer
    }
}

//var num1 = "2", num2 = "3"
//var num1 = "123", num2 = "456"
//var num1 = "49382", num2 = "5828"
var num1 = "1000000000000000000000000", num2 = "5080200008"

print(Solution().multiply(num1, num2))
