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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        //Let's do a one-pass time complexity of O(n)
        //and space complexity of O(1) solution as suggested by NeetCode. 

        var dummy = ListNode(0)
        dummy.next = head

        var leftPointer = head
        var rightPointer = head

        var loop = 0 

        while loop < n {
            rightPointer = rightPointer?.next
            loop += 1
        }

        var nodeBefore: ListNode?

        while rightPointer != nil {
            nodeBefore = leftPointer
            leftPointer = leftPointer?.next
            rightPointer = rightPointer?.next
        }

        nodeBefore?.next = leftPointer?.next
        // edge case - start
        if nodeBefore == nil {
            dummy.next = leftPointer?.next
        }

        return dummy.next
    }
}
