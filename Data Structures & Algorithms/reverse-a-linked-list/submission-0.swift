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

       var curr = head
       var prev: ListNode? = nil
       var temp: ListNode? = nil

       while curr != nil {
        temp = curr?.next
        curr?.next = prev
        prev = curr
        curr = temp
       }
       
       return prev

    }
}
