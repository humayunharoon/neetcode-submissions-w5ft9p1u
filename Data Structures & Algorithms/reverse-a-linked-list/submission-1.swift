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
        guard let _ = head else {
            return nil
        }

        var prev: ListNode? = nil
        var head: ListNode? = head

        while head != nil {
            var prevHead = head
            head = head?.next
            prevHead?.next = prev
            prev = prevHead
        }

        return prev
    }
}
