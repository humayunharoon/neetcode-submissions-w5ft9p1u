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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        var l1 = list1
        var l2 = list2

        var head: ListNode? = nil
        var tail: ListNode? = nil

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                if head == nil {
                    head = l1
                    tail = head
                } else {
                    tail?.next = l1
                    tail = tail?.next
                }
                l1 = l1?.next
            } else {
                if head == nil {
                    head = l2
                    tail = head
                } else {
                    tail?.next = l2
                    tail = tail?.next
                }
                l2 = l2?.next
            }
        }

        if l1 != nil {
            if head == nil {
                head = l1
            } else {
                tail?.next = l1
            }
        }

        if l2 != nil {
            if head == nil {
                head = l2
            } else {
                tail?.next = l2
            }
        }

        return head
    }
}
