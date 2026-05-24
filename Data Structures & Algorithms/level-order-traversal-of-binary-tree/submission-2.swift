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
import Collections

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {

        //var queue: [TreeNode?] = []
        var queue = Deque<TreeNode?>()
        var output: [[Int]] = []

        if root != nil {
            queue.append(root)
        } else {
            return output
        }

        while !queue.isEmpty {
            var array: [Int] = []
            var len = queue.count

            for _ in 0..<len {
                let node = queue.removeFirst()
                array.append(node!.val)
                if node?.left != nil {
                    queue.append(node?.left)
                }

                if node?.right != nil {
                    queue.append(node?.right)
                }
            }

            output.append(array)
        }

        return output
    }
}
