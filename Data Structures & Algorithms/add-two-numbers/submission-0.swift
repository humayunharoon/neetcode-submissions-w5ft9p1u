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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var dummy = ListNode(0)
        var tail: ListNode?
        
        var list1 = l1
        var list2 = l2

        var carry = 0

        while list1 != nil || list2 != nil {
            var sum1 = 0
            var sum2 = 0
            if let node = list1 {
                sum1 = node.val
            }

            if let node = list2 {
                sum2 = node.val
            }

            list1 = list1?.next
            list2 = list2?.next

            var sum = sum1 + sum2
            sum = sum + carry
            carry = 0

            if sum >= 10 {
                sum = sum - 10
                carry += 1
            }

            let ansNode = ListNode(sum)
            if tail == nil {
                tail = ansNode
                dummy.next = tail
            } else {
                tail?.next = ansNode
                tail = tail?.next
            }
        }  

        if carry > 0 {
            let ansNode = ListNode(1)
            tail?.next = ansNode
            tail = tail?.next
        }

        return dummy.next
    }
}
