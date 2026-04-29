class Solution {
    func evalRPN(_ tokens: [String]) -> Int {

        // add safety checks

        var stack: [Int] = []

        for token in tokens {
            // if op
            switch token {
                case "+":
                    let b = stack.removeLast()
                    let a = stack.removeLast()
                    let ans = a + b
                    stack.append(ans)
                case "-":
                    let b = stack.removeLast()
                    let a = stack.removeLast()
                    let ans = a - b
                    stack.append(ans)
                case "*":
                    let b = stack.removeLast()
                    let a = stack.removeLast()
                    let ans = a * b
                    stack.append(ans)
                case "/":
                    let b = stack.removeLast()
                    let a = stack.removeLast()
                    let ans = a / b
                    stack.append(ans)
                default:
                    stack.append(Int(token)!) 
            }
        }

        return stack.removeLast()
    }
}
