class MinStack {

    private var stack: [Int]
    private var minStack: [Int]

    init() {
        stack = []
        minStack = []
    }

    func push(_ val: Int) {
        stack.append(val)

        if minStack.isEmpty {
            minStack.append(val)
        } else {
            if let min = minStack.last {
                if val <= min {
                    minStack.append(val)
                } 
            } 
        }           
    }

    func pop() {
        let val = stack.removeLast()

        if let min = minStack.last {
            if val == min {
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
