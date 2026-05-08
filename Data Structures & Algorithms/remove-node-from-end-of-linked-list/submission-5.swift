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

        var head = head
        var current = head
        var count = 0

        // count O(n)
        while current != nil {
            count += 1
            current = current?.next
        }

        // traverse and remove function O(n)
        // 0-indexed
        let indexToRemove = count - n

        var nodeBefore: ListNode?
        var currentNode: ListNode? = head
        var currentIndex = 0

        while currentIndex <= indexToRemove {
            if currentIndex == indexToRemove {
                // edge case start
                if indexToRemove == 0 {
                    if count > 1 {
                        head = currentNode?.next
                    } else {
                        head = nil
                    }
                    break
                }

                // edge case end
                // if indexToRemove == (count - 1) {
                //     nodeBefore?.next = currentNode?.next
                // }

                // normal case
                nodeBefore?.next = currentNode?.next
                break
            }

            currentIndex += 1
            nodeBefore = currentNode
            currentNode = currentNode?.next
        }

        return head
    }
}
