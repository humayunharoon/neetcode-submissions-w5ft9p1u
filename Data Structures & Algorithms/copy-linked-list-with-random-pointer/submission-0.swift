/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

extension Node: Equatable & Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {

        // store a hash map of original list
        var hashMap: [Node: Int] = [:]
        var current = head

        // copy list
        let dummy = Node(0)
        var newList: Node?
        dummy.next = newList

        var counter = 0 
        while let node = current {
            hashMap[node] = counter
            counter += 1
            current = current?.next

            // create new list
            if newList == nil {
                dummy.next = Node(node.val)
                newList = dummy.next
            } else {
                newList?.next = Node(node.val)
                newList = newList?.next
            }
        }

        // store new list in array
        var arrayNewList: [Node] = []
        newList = dummy.next
        while let node = newList {
            arrayNewList.append(node)
            newList = newList?.next
        }

        // traverse original list, find index of random with hash map
        // connect using new array
        current = head
        while let node = current {
            if let randomNode = node.random {
                let indexOfRandom = hashMap[randomNode]!
                let indexOfNode = hashMap[node]!
                arrayNewList[indexOfNode].random = arrayNewList[indexOfRandom]
            }

            current = current?.next
        }

        return dummy.next
    }
}
