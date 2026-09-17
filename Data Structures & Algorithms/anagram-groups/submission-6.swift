class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {

        var output: [[String]] = []
        var masterDict: [[String:Int]: [String]] = [:]

        for string in strs {
            let characters = Array(string)
            
            var dict = [String: Int]()

            // EC
            if characters.isEmpty {
                dict["", default:0] += 1
            } else {
                for x in characters {
                    dict[String(x), default:0] += 1
                }
            }

            masterDict[dict, default:[]].append(string)
        }
        
        for x in masterDict.values {
            output.append(x)
        }

        return output
    }
}
