
import Collections

class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {

        guard !stones.isEmpty else {
            return 0
        }

        var stoneHeap = Heap(stones)

        while stoneHeap.count > 1 {
            let x = stoneHeap.removeMax()
            let y = stoneHeap.removeMax()
            
            let ans = x - y
            if ans > 0 {
                stoneHeap.insert(ans)
            }
        }

        return stoneHeap.max ?? 0
    }
}
