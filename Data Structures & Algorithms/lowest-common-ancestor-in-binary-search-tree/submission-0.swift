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

        var pathA: [TreeNode?] = []
        var pathB: [TreeNode?] = []

        findNodeAndMap(root, p, &pathA)
        findNodeAndMap(root, q, &pathB)

        let lenA = pathA.count - 1
        let lenB = pathB.count - 1

        let counter = min(lenA, lenB)
        var match: TreeNode? = TreeNode(0)

        for i in stride(from:0, through: counter, by: 1) {
            let nodeA = pathA[lenA - i]
            let nodeB = pathB[lenB - i]

            if nodeA!.val == nodeB!.val {
                match = nodeA
            } else {
                return match
            }
        }

        return match
    }

    func findNodeAndMap(_ root: TreeNode?, _ find: TreeNode?, _ path: inout [TreeNode?]) -> Void {
        if root!.val == find!.val {
            path.append(root)
            return
        }

        if find!.val > root!.val {
            findNodeAndMap(root?.right, find, &path)
        } else {
            findNodeAndMap(root?.left, find, &path)
        }

        path.append(root)
        return 
    }
}
