final class LRUCache {

    private final class Node: Equatable {

        static func == (lhs: LRUCache.Node, rhs: LRUCache.Node) -> Bool {
            Unmanaged.passUnretained(lhs).toOpaque() == Unmanaged.passUnretained(rhs).toOpaque()
        }

        let key: Int
        var value: Int
        var prevNode: Node?
        var nextNode: Node?

        init(key: Int, value: Int, prevNode: Node?=nil, nextNode: Node?=nil) {
            self.key = key
            self.value = value
            self.prevNode = prevNode
            self.nextNode = nextNode
        }

        func removeLink() {
            self.prevNode?.nextNode = nil
            self.nextNode?.prevNode = nil
            self.prevNode = nil
            self.nextNode = nil
        }
    }

    private var cache: [Int: Node] = [:]
    private var capacity: Int
    private var currentCapacity: Int = 0
    private var head: Node?
    private var tail: Node?

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        //print(#function, key)
        if let node = cache[key] {
            changeLRU(node: node)
            return node.value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if cache[key] != nil { // there is the value
            let temp = cache[key]!
            temp.value = value // update value
            changeLRU(node: temp) // update LRU
        } else { // no such value
            let temp = Node(key: key, value: value)
            //print(#function, capacity, currentCapacity, temp.value)
            if capacity == currentCapacity { // full
                let toRemove = tail
                tail = tail?.prevNode
                remove(node: toRemove) // remove last
            } else {
                currentCapacity += 1
            }
            cache[key] = temp
            changeLRU(node: temp)
        }
    }

    private func remove(node: Node?) {
        guard let node = node else { return }
        //print(#function, capacity, currentCapacity, node.value)
        node.removeLink()
        if node == head { head = head?.nextNode }
        if node == tail { tail = tail?.prevNode }
        cache[node.key] = nil
    }

    private func changeLRU(node: Node) {
        //print(#function, capacity, currentCapacity, node.value, head?.key, head?.value)
        if head == nil { // if list is empty
            head = node
            tail = node
        } else {
            if head == node { // no need to change LRU
                return
            } else { // node should be the head
                node.prevNode?.nextNode = node.nextNode
                node.nextNode?.prevNode = node.prevNode
                if tail == node { tail = node.prevNode }
                node.nextNode = head
                node.prevNode = nil
                head?.prevNode = node
                head = node
            }
        }
    }
}
