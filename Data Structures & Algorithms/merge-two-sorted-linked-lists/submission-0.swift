/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        guard let _ = list1 else {
            return list2
        }

        guard let _ = list2 else {
            return list1
        }

        var A = list1
        var B = list2
        var head: ListNode?
        var currentNode: ListNode?
        
        if (A!.val <= B!.val) {
            head = A
            A = A?.next
        } else {
            head = B
            B = B?.next
        }

        currentNode = head

        while let currentCode = currentNode {

            if let aVal = A?.val, let bVal = B?.val {
                if (aVal <= bVal) {
                    currentNode?.next = A
                    currentNode = A
                    A = A?.next
                } else {
                    currentNode?.next = B
                    currentNode = B
                    B = B?.next
                }
            } else {
                if let aVal = A?.val {
                    currentNode?.next = A
                    currentNode = nil
                } else if let bVal = B?.val {
                    currentNode?.next = B
                    currentNode = nil
                }
            }
        }

        return head

    }
}