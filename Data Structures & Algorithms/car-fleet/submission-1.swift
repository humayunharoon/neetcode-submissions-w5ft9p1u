class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        
        // pairing each car into its position and speed
        var carPairs: [(Int, Int)] = zip(position, speed).map {($0, $1)}
        var stack: [Double] = []
        
        // sort in decending order based on positiion
        carPairs.sort{ $0.0 > $1.0 } 
        
        // process from nearest to target to start
        // calculate how much time to reach target
        // carPairs is sorted in reverse, so we can traverse positively
        for (p, s) in carPairs {
            let time = Double(target - p) / Double(s)
            stack.append(time)

            if stack.count >= 2 && ( stack[stack.count - 1] <= stack[stack.count - 2] ) {
                // because cars will bump or get to finish line at the same time
                // remove the car at the top, which is faster.
                stack.removeLast()
            }
        }

        return stack.count
    }
}