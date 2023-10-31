final class WordDictionary {

    private final class WordLink {
        let value: Character
        var next: [Character: WordLink] = [:]
        var isWord = false
        init(value: Character) {
            self.value = value
        }
    }
    
    private var words: WordLink
    
    init() {
        words = .init(value: "*")
    }
    
    func addWord(_ word: String) {
        var nowCh = words
        for ch in word {
            if let nextCh = nowCh.next[ch] {
                nowCh = nextCh
            } else {
                let nextCh = WordLink(value: ch)
                nowCh.next[ch] = nextCh
                nowCh = nextCh
            }
        }
        nowCh.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        var nowChs = [words]
        for ch in word {
            var nextChs: [WordLink] = []
            if ch == "." {
                nextChs = nowChs.flatMap({$0.next.values})
                nowChs = nextChs
            } else {
                for nowCh in nowChs {
                    if let nextCh = nowCh.next[ch] {
                        nextChs.append(nextCh)
                    }
                }
                nowChs = nextChs
            }
        }
        for nowCh in nowChs {
            if nowCh.isWord { return true }
        }
        return false
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
