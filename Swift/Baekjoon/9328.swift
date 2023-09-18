// 아무래도 dfs로 풀어야할듯
// 가장자리들을 시작점으로 하는 dfs를 여러번 돌리도록하자
// 그리고 문서를 획득하면 그곳을 .으로 표시해주자

// 각각의 지점들에 대해 enum으로 정의
enum Space: Equatable {
    case wall
    case empty
    case document
    case door(Character)
    case key(Character)
    
    init(ch: Character) {
        switch ch {
        case "*":
            self = .wall
        case ".":
            self = .empty
        case "$":
            self = .document
        case "a"..."z":
            self = .key(ch)
        case "A"..."Z":
            self = .door(ch)
        default:
            self = .empty // 없을 경우 empty
        }
    }
}

var building: [[Space]] = []
var visited: [[Bool]] = []
var keys: Set<Character> = []
var queue: [(Int, Int)] = []
var h: Int = 0, w: Int = 0
var dy = [1, -1, 0, 0]
var dx = [0, 0, 1, -1]
var answer = 0
let T = Int(readLine()!)!


func dfs(y: Int, x: Int) {
    visited[y][x] = true
    
    switch building[y][x] {
    case .wall:
        return
    case .document:
        building[y][x] = .empty
        answer += 1
    case .door(let ch):
        if keys.contains(Character(ch.lowercased())) {
            building[y][x] = .empty
        } else {
            // 키가 없으면 다른곳 먼저 갔다가 다시 한번 보자.
            queue.append((y, x))
            return
        }
    case .key(let ch):
        keys.insert(ch)
        building[y][x] = .empty
    case .empty:
        break
    }
    
    for i in 0..<4 {
        let nextY = y + dy[i]
        let nextX = x + dx[i]
        if nextY < 0 || nextY >= h || nextX < 0 || nextX >= w {
            continue
        }
        
        if visited[nextY][nextX] { continue }
        
        dfs(y: nextY, x: nextX)
        
    }
}

func input() {
    let hw = readLine()!.split(separator: " ").map { Int(String($0))! }
    (h, w) = (hw[0], hw[1])
    building = [[Space]](repeating: [Space](), count: h)
    visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
    queue = []
    answer = 0
    for i in 0..<h {
        building[i] = readLine()!.reduce(into: [Space](), { partialResult, ch in
            partialResult.append(Space(ch: ch))
        })
    }
    keys = Set(readLine()!)
    if keys.contains("0") { keys = [] } // 입력이 0일경우 초기화
}

for _ in 0..<T {
    // 입력 받기 및 변수 초기화
    input()
    
    // dfs해보자고
    // 외벽으로만 접근 가능
    for i in 0..<h {
        if i == 0 || i == h-1 {
            for j in 0..<w {
                dfs(y: i, x: j)
            }
        } else {
            dfs(y: i, x: 0)
            dfs(y: i, x: w-1)
        }
    }
    
    // 다 했으면 큐가 계속있을 동안 반복 (못간곳 탐색)
    
    var thisQueue = [(Int, Int)](queue.reversed())
    var prevQueue = thisQueue
    queue = []
    while !thisQueue.isEmpty {
        let (y, x) = thisQueue.popLast()!
        dfs(y: y, x: x)
        if thisQueue.isEmpty {
            thisQueue = [(Int, Int)](queue.reversed())
            queue = []
            var isDifference = false
            for i in 0..<thisQueue.count {
                if prevQueue[i].0 != thisQueue[i].0 || prevQueue[i].1 != thisQueue[i].1 {
                    isDifference = true
                    break
                }
            }
            if !isDifference { break } // 이전과 큐가 안달라지면 영원히 갈 수 없는 거임 -> while문 탈출
            prevQueue = thisQueue
        }
    }
    
    // 모든 일을 마쳤으면 답을 출력
    print(answer)
}

