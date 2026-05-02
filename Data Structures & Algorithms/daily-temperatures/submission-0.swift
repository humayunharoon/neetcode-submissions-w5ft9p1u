class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {

        var result = Array(repeating:0, count:temperatures.count)
        var stack: [(temp: Int, index: Int)] = []

        for (index, temp) in temperatures.enumerated() {

            while !stack.isEmpty && stack.last!.temp < temp {
                let dayWithLessTemp = stack.popLast()!
                result[dayWithLessTemp.index] = index - dayWithLessTemp.index
            }

            stack.append((temp: temp, index: index))
        }

        return result
    }
}
