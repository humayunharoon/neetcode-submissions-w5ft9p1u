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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        var res = 0

        let LD = depth(root?.left, &res)
        let RD = depth(root?.right, &res)

        res = max(LD + RD, res)

        return res
    }

    func depth(_ root: TreeNode?, _ res: inout Int) -> Int {
        if root == nil {
            return 0
        }

        let LD = depth(root?.left, &res)
        let RD = depth(root?.right, &res)

        res = max(LD + RD, res)

        return 1 + max(LD, RD)
    }
}
