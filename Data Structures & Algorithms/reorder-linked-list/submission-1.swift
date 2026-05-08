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
    func reorderList(_ head: ListNode?) {
        // O(n), O(1) solution

        var slowPointer = head
        var fastPointer = head?.next

        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }

        var secondHalf = slowPointer?.next
        slowPointer?.next = nil

        // reverse the second half
        var prev: ListNode? = nil
        var current = secondHalf

        while current != nil {
            var next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        // this is the end of the second list, linked backwards
        secondHalf = prev
        var firstHalf = head

        var leftNext: ListNode?
        var rightNext: ListNode?

        while secondHalf != nil {
            leftNext = firstHalf?.next
            rightNext = secondHalf?.next

            firstHalf?.next = secondHalf
            secondHalf?.next = leftNext
            
            firstHalf = leftNext
            secondHalf = rightNext
        }

    }
}
