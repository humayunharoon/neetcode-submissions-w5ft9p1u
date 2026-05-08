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

        if head == nil { return }

        var array: [ListNode] = []
        var current = head
        var headToReturn = head

        // traverse and store pointers O(n), O(n)
        while let node = current {
            array.append(node)
            current = node.next
        }

        var l = 1
        var r = array.count - 1 
        var leftTurn = false
        var tail = headToReturn

        while l <= r {
            if leftTurn == true {
                tail?.next = array[l]
                tail = tail?.next
                tail?.next = nil
                leftTurn = false
                l += 1
            } else {
                tail?.next = array[r]
                tail = tail?.next
                tail?.next = nil
                leftTurn = true
                r -= 1
            }
        }
    }
}
