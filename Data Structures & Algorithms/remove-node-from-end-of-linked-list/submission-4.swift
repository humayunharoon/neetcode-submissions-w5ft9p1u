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

        var listArray: [ListNode?] = []
        var head = head
        var current = head
        
        while current != nil {
            listArray.append(current)
            current = current?.next
        }

        var count = listArray.count
        var indexToRemove = count - n

        var leftNode: ListNode?
        var rightNode: ListNode?
        var currentNode = listArray[indexToRemove]

        if indexToRemove - 1 >= 0 {
            leftNode = listArray[indexToRemove - 1]
        }

        if indexToRemove + 1 < count {
            rightNode = listArray[indexToRemove + 1]
        }

        //currentNode?.next = nil
        leftNode?.next = rightNode

        // edge case - if current Node is head
        if indexToRemove == 0 {
            if rightNode != nil {
                head = rightNode
            } else {
                head = nil
            }
        }

        return head
    }
}
