class Solution {

    func encode(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }

        var output = ""

        for string in strs {
            output += String(string.count) + "#" + string
        }

        return output
    }

    func decode(_ str: String) -> [String] {
        if str.isEmpty { return [] }
        var output: [String] = []
        var i = 0

        while i < str.count {
            var j = i

            var index = str.index(str.startIndex, offsetBy:j)
            while str[index] != "#" {
                j += 1
                index = str.index(str.startIndex, offsetBy: j)
            }


            var startIndex = str.index(str.startIndex, offsetBy:i)
            var endIndex = str.index(str.startIndex, offsetBy:j)

            let key = Int(str[startIndex..<endIndex])!

            startIndex = str.index(str.startIndex, offsetBy:j + 1)
            endIndex = str.index(str.startIndex, offsetBy:j + 1 + key)

            let answer = String(str[startIndex..<endIndex])
            output.append(answer)

            i = j + 1 + key
        }

        return output
    }
}
