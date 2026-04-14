class MinStack {

    var stack: [Int]
    var minStack: [Int]

    init() {
        stack = []
        minStack = []
    }

    func push(_ val: Int) {
        stack.append(val)
        if let min = minStack.last {
            if val <= min {
                minStack.append(val)
            }
        } else {
            minStack.append(val)
        }
    }

    func pop() {
        let value = stack.removeLast()
        if let min = minStack.last {
            if value == min {
                minStack.removeLast()
            }
        }
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
}
