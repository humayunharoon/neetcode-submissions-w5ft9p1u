import Collections

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {

        var heap: Heap<Int> = Heap<Int>()

        for num in nums {
            heap.insert(num)

            if heap.count > k {
                heap.removeMin()
            }
        }

        return heap.min!
    }
}
