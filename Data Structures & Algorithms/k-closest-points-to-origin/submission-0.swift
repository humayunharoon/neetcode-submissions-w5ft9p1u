import Collections // Contains Apple's official Heap implementation

// 1. Define a struct that conforms to Comparable
struct Task: Comparable {
    let coord: [Int]
    let distance: Double

    // 2. Implement the required '<' operator to compare priorities
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.distance < rhs.distance
    }
}

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {

        let originX = 0.0
        let originY = 0.0

        var taskHeap = Heap<Task>()

        for point in points {
            let x = Double(point[0])
            let y = Double(point[1])

            let l = (x - originX) * (x - originX)
            let r = (y - originY) * (y - originY)
            let distance: Double = sqrt( l + r )
            taskHeap.insert(Task(coord: point, distance: distance))

            if taskHeap.count > k {
                taskHeap.removeMax()
            }
        }

        var output: [[Int]] = []

        while !taskHeap.isEmpty {
            output.append(taskHeap.removeMin().coord)
        }

        return output
    }
}
