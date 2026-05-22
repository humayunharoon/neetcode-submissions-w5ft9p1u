/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        var isBalanced = true

        _ = DFS(root, &isBalanced)

        return isBalanced
    }

    func DFS(_ node: TreeNode?, _ isBal: inout Bool) -> Int {
        if node == nil {
            return 0
        }

        let left = DFS(node?.left, &isBal)
        let right = DFS(node?.right, &isBal)

        let delta = left - right
        if delta < -1 || delta > 1 {
            isBal = false
        }

        return 1 + max(left, right)
    }
}
