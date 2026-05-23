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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }

        if root == nil || subRoot == nil {
            return false
        }

        var queue: [TreeNode?] = []

        queue.append(root)

        while !queue.isEmpty {
            let count = queue.count

            for _ in 0..<count {
                let node = queue.removeFirst()
                if node?.val == subRoot?.val {
                    if treeMatch(node, subRoot) == true {
                        return true
                    }
                }
                if node?.left != nil {
                    queue.append(node?.left)
                }

                if node?.right != nil {
                    queue.append(node?.right)
                }
            }
        }

        return false
    }

    func treeMatch(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }

        if p?.val != q?.val {
            return false
        }

        let left = treeMatch(p?.left, q?.left)
        let right = treeMatch(p?.right, q?.right)

        return (left && right)
    }
}
