class Solution {
    func generateParenthesis(_ n: Int) -> [String] {

        var result: [String] = []

        func gen(_ l: Int, _ r: Int, _ str: String) {

            if l == n && r == n && l == r {
                result.append(str)
                return
            }

            if l < n {
                gen(l + 1, r, str + "(")
            }

            if r < l {
                gen(l, r + 1, str + ")")
            }
        }

        gen(0, 0, "")
        return result
    }
}
