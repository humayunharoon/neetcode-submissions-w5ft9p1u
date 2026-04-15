class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        

        var outputDict: [Array<Int>: [String]] = [:]



        for string in strs {

            var hashTuple = [Int](repeating: 0, count: 26)
            for char in string {
                hashTuple[Int(char.asciiValue!) - 97] += 1
            }

            outputDict[hashTuple, default:[]].append(string)
        }

        // unwrap all values into one Array,
        return Array(outputDict.values)
    }
}
