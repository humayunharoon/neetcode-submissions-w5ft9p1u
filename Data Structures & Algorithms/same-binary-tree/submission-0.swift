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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        var isEqual = true
        
        if p == nil && q != nil || p != nil && q == nil {
            return false
        }

        if p == nil && q == nil {
            return true
        }

        var queueA: [TreeNode?] = []
        var queueB: [TreeNode?] = []

        queueA.append(p)
        queueB.append(q)

        while !queueA.isEmpty || !queueB.isEmpty {
            let countA = queueA.count
            let countB = queueB.count

            if countA != countB {
                return false
            }

            for i in 0..<countA {
                let nodeA = queueA.removeFirst()
                let nodeB = queueB.removeFirst()

                if nodeA?.val != nodeB?.val {
                    return false
                }

                if nodeA?.left != nil || nodeB?.left != nil {
                    if nodeA?.left?.val != nodeB?.left?.val {
                        return false
                    }
                    queueA.append(nodeA?.left)
                    queueB.append(nodeB?.left)
                }

                if nodeA?.right != nil || nodeB?.right != nil {
                    if nodeA?.right?.val != nodeB?.right?.val {
                        return false
                    }
                    queueA.append(nodeA?.right)
                    queueB.append(nodeB?.right)
                }
            }
        }
    
        return isEqual
    }
}