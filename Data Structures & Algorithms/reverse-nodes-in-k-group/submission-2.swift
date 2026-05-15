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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {

        var leftGroup: ListNode?
        var rightGroup: ListNode?
        var start: ListNode? // start before each counting loop
        var array: [ListNode?] = Array(repeating:nil, count:k)

        let dummy = ListNode(0)

        // starting point
        start = dummy
        dummy.next = head
        
        while start?.next != nil {

            leftGroup = start

            for i in 0..<k {
                start = start?.next
                if start == nil {
                    break
                }
                array[i] = start

                // reorder when end
                if i == (k - 1) {
                    rightGroup = start?.next
                    reorder(array, k)
                    leftGroup?.next = array[k - 1]
                    array[0]?.next = rightGroup
                    start = array[0]
                }
            }
        }
        
        return dummy.next
    }

    func reorder(_ array:[ListNode?],_ k: Int) {
        for i in stride(from: k - 1, to:0, by:-1) {
            array[i]?.next = array[i - 1]
        }
    }
}
