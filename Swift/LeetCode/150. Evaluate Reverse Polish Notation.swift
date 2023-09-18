class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        tokens.forEach { token in
            switch token {
            case "+":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 + num2)
            case "-":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 - num2)
            case "*":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 * num2)
            case "/":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 / num2)
            default:
                stack.append(.init(token)!)
            }
        }
        return stack[0]
    }
}
