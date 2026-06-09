import Collections

class KthLargest {
    
    var k: Int
    var deque: Deque<Int> = []
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k

        for num in nums {
            processDeque(num)
        }
    }

    func add(_ val: Int) -> Int {
        processDeque(val)
        return self.deque.first!
    }

    func processDeque(_ num:Int) {

        deque.append(num)
        deque.sort()
        if self.deque.count > self.k {
            deque.removeFirst()
        }
    }
}
