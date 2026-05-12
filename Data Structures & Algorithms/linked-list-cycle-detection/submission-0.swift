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

 extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        
        var slow = head?.next
        var fast = head?.next?.next

        while slow != nil || fast != nil {
            if slow == fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }

        return false
    }
}
