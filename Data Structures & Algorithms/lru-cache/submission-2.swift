class Node {

    let key: Int
    var value: Int
    var prev: Node?
    var next: Node?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {

    let cap: Int
    let left: Node
    let right: Node
    var dict: [Int: Node] // points to Nodes in double linked lists

    init(_ capacity: Int) {
        self.cap = capacity
        self.left = Node(0, 0)
        self.right = Node(0, 0)

        self.left.next = self.right
        self.right.prev = self.left

        self.dict = [:]
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(node)
            add(node)
            return node.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            remove(node)
            node.value = value
            add(node)
        } else {
            let node = Node(key, value)
            dict[key] = node
            add(node)

            if dict.count > self.cap {
                let lru = self.left.next!
                dict[lru.key] = nil
                remove(lru)
            }
        }
    }

    func remove(_ node: Node) {
        let prevNode = node.prev!
        let nextNode = node.next!

        prevNode.next = nextNode
        nextNode.prev = prevNode
    }

    func add(_ node: Node) {
        let prevNode = self.right.prev!
        prevNode.next = node
        node.next = self.right
        self.right.prev = node
        node.prev = prevNode
    }
}