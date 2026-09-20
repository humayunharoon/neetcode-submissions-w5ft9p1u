class Solution {

    func encode(_ strs: [String]) -> String {
        var output = ""

        for str in strs {
            let len = str.count
            output += "\(len)"
            output += "#"
            output += str
        }

        return output
    }

    func decode(_ str: String) -> [String] {

        var output: [String] = []
        let stringArray = Array(str)

        var currentIndex = 0

        while currentIndex < stringArray.count {

            var len = ""
            while stringArray[currentIndex] != "#" {
                len += String(stringArray[currentIndex])
                currentIndex += 1
            }

            var count = Int(len)!

            // move over #
            currentIndex += 1 

            var word = ""
            
            while count > 0 {
                word += String(stringArray[currentIndex])
                currentIndex += 1
                count -= 1
            }

            output.append(word)
        }

        return output
    }
}
