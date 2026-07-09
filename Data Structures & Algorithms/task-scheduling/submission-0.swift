import Collections

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
        var dict: [Character: Int] = [:]
        var deque: Deque<(Int,Int)> = []
        var timer = 0

        for letter in tasks {
            dict[letter, default:0] += 1
        }

        var heap = Heap(dict.values)
        
        while !heap.isEmpty || !deque.isEmpty {
            timer += 1
            
            if let pendingTask = deque.first {
                if pendingTask.1 == timer {
                    _ = deque.popFirst()
                    heap.insert(pendingTask.0)
                }
            }

            if let currentMax = heap.popMax() {
                let remaining = currentMax - 1
                if remaining > 0 {
                    deque.append((remaining, timer + n + 1))
                }
            }
        }
    
        return timer
    }
}