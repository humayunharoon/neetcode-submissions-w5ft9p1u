class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {

        var dict: [Character: Int] = [:]

        // traverse S1 and store in dict
        let s1 = Array(s1)
        let s2 = Array(s2)

        for char in s1 {
            dict[char, default: 0] += 1
        }

        // check if S1 dict can decrement from S2 safely
        for i in 0..<s2.count {
            
            var j = i
            var cycleDict = dict

            while j < s2.count {
                let key = s2[j]
                if let val = cycleDict[key] {
                    let newVal = val - 1

                    if newVal == 0 {
                        cycleDict[key] = nil
                    } else {
                        cycleDict[key] = newVal
                    }
                
                    if cycleDict.isEmpty {
                        return true
                    }

                } else {
                    if cycleDict.isEmpty {
                        return true
                    } else {
                        break
                    }
                }
                j += 1
            }      
        }
        return false
    }
}
