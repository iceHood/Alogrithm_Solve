
class Trie {
    
    var setS: Set<String> = []
    init() {
        
    }
    
    func insert(_ word: String) {
        setS.insert(word)
    }
    
    func search(_ word: String) -> Bool {
        setS.contains(word)
    }
    
    func startsWith(_ prefix: String) -> Bool {
        setS.contains(where: {$0.hasPrefix(prefix)})
    }
}
final class Trie2 {
    
    private final class Node {
        let value: Character
        var children = [Character: Node]()
        var isWord = false
        init(_ value: Character) {
            self.value = value
        }
    }
    
    private let root = Node("*")
    
    init() {}
    
    func insert(_ word: String) {
        var node = root
        for ch in word {
            if let nextNode = node.children[ch] {
                node = nextNode
            } else {
                let nextNode = Node(ch)
                node.children[ch] = nextNode
                node = nextNode
            }
        }
        node.isWord = true
    }
    
    private func findLast(_ word: String) -> Node? {
        var node = root
        for ch in word {
            if let nextNode = node.children[ch] {
                node = nextNode
            } else {
                return nil
            }
        }
        return node
    }
    
    func search(_ word: String) -> Bool {
        findLast(word)?.isWord == true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        findLast(prefix) != nil
    }
}
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
