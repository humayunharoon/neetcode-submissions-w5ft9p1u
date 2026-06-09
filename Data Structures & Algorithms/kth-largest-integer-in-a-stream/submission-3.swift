import Collections

class KthLargest {
    
    var heap: Heap<Int>
    let k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.heap = Heap(nums)
        self.k = k 

        while heap.count > self.k {
            self.heap.removeMin()
        }
    }

    func add(_ val: Int) -> Int {
        self.heap.insert(val)
        if heap.count > self.k {
            self.heap.removeMin()
        }

        return self.heap.min!
    }
}
