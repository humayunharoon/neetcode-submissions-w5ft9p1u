class Solution {
    func isValid(_ s: String) -> Bool {

        var stack : [Character] = []
        var value = true

        for char in s {
            switch char {
                case "(":
                    stack.append("(")
                case "{":
                    stack.append("{")
                case "[":
                    stack.append("[")
                case ")":
                    if let last = stack.last, last == "(" {
                        stack.removeLast()
                    } else {
                        value = false
                    }
                case "}":
                    if let last = stack.last, last == "{" {
                        stack.removeLast()
                    } else {
                        value = false
                    }
                case "]":
                    if let last = stack.last, last == "[" {
                        stack.removeLast()
                    } else {
                        value = false
                    }
                default:
                    break
            }
            if value == false {
                break
            }
        }

        if !stack.isEmpty {
            value = false
        }
        return value
    }
}
