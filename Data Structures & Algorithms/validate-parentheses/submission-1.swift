class Solution {
    func isValid(_ s: String) -> Bool {
        
        if s == "" {
            return true
        }

        let s = Array(s)
        var stack: [Character] = []

        for c in s {
            switch c {
                case "(":
                    stack.append(c)
                case "[":
                    stack.append(c)
                case "{":
                    stack.append(c)
                case ")":
                    if "(" != stack.popLast() { return false }
                case "}":
                    if "{" != stack.popLast() { return false }
                case "]":
                    if "[" != stack.popLast() { return false }
                default:
                    return false
            }
        }

        return stack.isEmpty
    }
}
