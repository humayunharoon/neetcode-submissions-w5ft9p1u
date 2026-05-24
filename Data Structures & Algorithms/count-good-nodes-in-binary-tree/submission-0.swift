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
    func goodNodes(_ root: TreeNode?) -> Int {
    
        var count = 0

        dfs(root, -101, &count)

        return count
    }

    func dfs(_ root: TreeNode?, _ max: Int, _ count: inout Int) {
        
        var max = max

        if root != nil && root!.val >= max {
            count += 1
            max = root!.val
        }

        if root?.left != nil {
            dfs(root?.left, max, &count)
        }

        if root?.right != nil {
            dfs(root?.right, max, &count)
        }
    }
}
