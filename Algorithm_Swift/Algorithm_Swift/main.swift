import Foundation

struct DoubleStackQueue<Element> {
    private var inbox: [Element] = []
    private var outbox: [Element] = []
    
    var isEmpty: Bool{
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var count: Int{
        return inbox.count + outbox.count
    }
    
    var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    init() { }
    
    init(_ array: [Element]) {
        self.init()
        self.inbox = array
    }
    
    mutating func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    mutating func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
    }
}

extension DoubleStackQueue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init()
        inbox = elements
    }
}

var input = readLine()!.split(separator: " ").map { Int($0)! }

let N = input[0]
let K = input[1]

var visit: [Int: Bool] = [:]
var q: DoubleStackQueue<(Int, Int)> = DoubleStackQueue()

q.enqueue((N, 0))
var minTime: Int?
var visitCount = 0

while !q.isEmpty {
    let (nowPos, nowTime) = q.dequeue()
    visit[nowPos] = true
    
    if let time = minTime, nowPos == K && time == nowTime {
        visitCount += 1
    }
    
    if nowPos == K && minTime == nil {
        minTime = nowTime
        visitCount += 1
    }
    
    if let time = minTime, time <= nowTime {
        continue
    }
    
    if nowPos + 1 < 100001 && visit[nowPos + 1] == nil {
        q.enqueue((nowPos + 1, nowTime + 1))
    }
    if nowPos - 1 >= 0 && visit[nowPos - 1] == nil {
        q.enqueue((nowPos - 1, nowTime + 1))
    }
    if nowPos * 2 < 100001 && visit[nowPos * 2] == nil {
        q.enqueue((nowPos * 2, nowTime + 1))
    }
}

if let time = minTime {
    print(time)
    print(visitCount)
}

