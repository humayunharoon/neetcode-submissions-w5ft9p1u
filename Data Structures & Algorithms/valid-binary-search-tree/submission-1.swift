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
    func isValidBST(_ root: TreeNode?) -> Bool {

        return isValid(root, Int.min, Int.max)
    }

    func isValid(_ root: TreeNode?, _ leftBound: Int, _ rightBound: Int) -> Bool {
        
        // nil check
        if root == nil {
            return true
        }

        if root!.val > leftBound && root!.val < rightBound {
            let left = isValid(root?.left, leftBound, root!.val)
            let right = isValid(root?.right, root!.val, rightBound)

            return left && right
        } else {
            return false
        }
    }
}
