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
    func rightSideView(_ root: TreeNode?) -> [Int] {

        var queue: Deque<TreeNode?> = Deque()
        var output: [Int] = []

        if root == nil {
            return output
        }

        queue.append(root)

        while !queue.isEmpty {
            let len = queue.count

            for i in 0..<len {
                let node = queue.removeFirst()
                if i == len - 1 {
                    output.append(node!.val)
                }

                if node?.left != nil {
                    queue.append(node?.left)
                }

                if node?.right != nil {
                    queue.append(node?.right)
                }
            }
        }
        return output
    }
}
