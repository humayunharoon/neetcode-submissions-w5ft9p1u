class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var store: [[Character:Int]: [String]] = [:]

        for str in strs {
            let key = anagramKey(str)
            if var anagrams = store[key] {
                anagrams.append(str)
                store[key] = anagrams
            } else {
                store[key] = [str]
            }
        }
        return Array(store.values)
    }

    func anagramKey(_ str: String) -> [Character:Int] {
        var output = [Character: Int]()
        let stringArray = Array(str)

        for c in stringArray {
            output[c, default:0] += 1
        }

        return output
    }
}
