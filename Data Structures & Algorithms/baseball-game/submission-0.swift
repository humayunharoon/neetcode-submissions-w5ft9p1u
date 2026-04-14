class Stack {
  var stack: [Int] = []

  func push(_ n: Int) {
    stack.append(n)
  } 

  func pop() -> Int {
    return stack.removeLast()
  }

  func isEmpty() -> Bool {
    return stack.isEmpty
  }
}

class Solution {
    func calPoints(_ operations: [String]) -> Int {

        var stack = Stack()
        var answer = 0

        for op in operations {
            switch op {
            case "+":
                let prev1 = stack.pop()
                let prev2 = stack.pop()
                stack.push(prev2)
                stack.push(prev1)
                stack.push(prev1 + prev2)

            case "D":
                let prev = stack.pop()
                stack.push(prev)
                stack.push(prev * 2)

            case "C":
                _ = stack.pop()

            default:
                stack.push(Int(op)!)
            }
        }

        while !stack.isEmpty() {
            answer = answer + stack.pop()
        }
        return answer
    }
}
