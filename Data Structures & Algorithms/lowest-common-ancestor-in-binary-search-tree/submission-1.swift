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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

        // If one of the values is found first 
        if root!.val == p!.val || root!.val == q!.val {
            return root
        }

        if root!.val > p!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else if (root!.val < p!.val && root!.val < q!.val) {
            return lowestCommonAncestor(root?.right, p, q)
        } else {
            return root
        }
    }
}
