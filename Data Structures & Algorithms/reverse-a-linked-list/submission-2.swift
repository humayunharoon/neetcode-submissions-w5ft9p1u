/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */



class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var newHead: ListNode? = nil

        // recursive
        func reverse(_ node: ListNode?) -> ListNode? {
            if node?.next == nil {
                newHead = node
                return node
            }

            var ret = reverse(node?.next)
            ret?.next = node
            node?.next = nil
            return node
        }

        reverse(head)

        return newHead
    }
}
