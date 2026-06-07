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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var array:[Int] = []

        inOrder(root, k, &array)

        return array[k - 1]
    }

    func inOrder(_ root: TreeNode?, _ k: Int, _ array: inout [Int]) {
        if root == nil {
            return
        }

        inOrder(root?.left, k, &array)
        array.append(root!.val)
        if array.count == k {
            return 
        }
        inOrder(root?.right, k, &array)

        return
    }
}
