enum MapThings{
    case wall
    case empty
    case redBall
    case blueBall
    case hole

    init(ch: Character) {
        switch ch {
        case "#": self = .wall
        case ".": self = .empty
        case "R": self = .redBall
        case "B": self = .blueBall
        case "O": self = .hole
        default: self = .empty
        }
    }
}


enum Move {
    case left, right, up, down
    func reverse() -> Self {
        switch self {
        case .left:
            return .right
        case .right:
            return .left
        case .up:
            return .down
        case .down:
            return .up
        }
    }
}

extension Move: CaseIterable { }
/*
extension MapThings: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .wall:
            return "#"
        case .empty:
            return "."
        case .redBall:
            return "R"
        case .blueBall:
            return "B"
        case .hole:
            return "O"
        }
    }
}
extension Move: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        case .up:
            return "up"
        case .down:
            return "down"
        }
    }
}
*/
typealias Coordinate = (x: Int, y: Int)

let NM = readLine()!.split(separator: " ").map({ Int(String($0))! })
let (N, M) = (NM[0], NM[1])
var graph = [[MapThings]](repeating: [MapThings](), count: N)
let dy = [-1, 1, 0, 0], dx = [0, 0, -1, 1] // up, down, left, right
var redBall: Coordinate = (0, 0)
var blueBall: Coordinate = (0, 0)
var hole: Coordinate = (0, 0)

for i in 0..<N {
    graph[i] = readLine()!.enumerated().map {
        let t = MapThings(ch: $0.element)
        if t == .redBall {
            redBall.x = $0.offset
            redBall.y = i
        } else if t == .blueBall {
            blueBall.x = $0.offset
            blueBall.y = i
        } else if t == .hole {
            hole.x = $0.offset
            hole.y = i
        }
        return t
    }
}

func move(to way: Move) {

    func canMove(pos: Coordinate) -> Bool {
        switch graph[pos.y][pos.x] {
        case .empty, .hole: return true
        default: return false
        }
    }

    var howToMove = 0 // default = up
    var isRedFirst = false
    switch way {
    case .up:
        howToMove = 0
        if redBall.y < blueBall.y { // red가 위랑 가까우면 red먼저 움직이기
            isRedFirst = true
        }
    case .down:
        howToMove = 1
        if redBall.y > blueBall.y { // red가 아래랑 가까우면 red먼저 움직이기
            isRedFirst = true
        }
    case .left:
        howToMove = 2
        if redBall.x < blueBall.x { // red가 왼쪽이랑 가까우면 red먼저 움직이기
            isRedFirst = true
        }
    case .right:
        howToMove = 3
        if redBall.x > blueBall.x { // red가 오른쪽이랑 가까우면 red먼저 움직이기
            isRedFirst = true
        }
    }

    if isRedFirst {
        var (nextX, nextY) = (redBall.x + dx[howToMove], redBall.y + dy[howToMove])
        while canMove(pos: (nextX, nextY)) {
            graph[redBall.y][redBall.x] = .empty
            redBall.x = nextX
            redBall.y = nextY
            graph[redBall.y][redBall.x] = .redBall
            if redBall == hole {
                graph[redBall.y][redBall.x] = .hole
                break
            }
            (nextX, nextY) = (redBall.x + dx[howToMove], redBall.y + dy[howToMove])
        }
        (nextX, nextY) = (blueBall.x + dx[howToMove], blueBall.y + dy[howToMove])
        while canMove(pos: (nextX, nextY)) {
            graph[blueBall.y][blueBall.x] = .empty
            blueBall.x = nextX
            blueBall.y = nextY
            graph[blueBall.y][blueBall.x] = .blueBall
            if blueBall == hole {break}
            (nextX, nextY) = (blueBall.x + dx[howToMove], blueBall.y + dy[howToMove])
        }
    } else {
        var (nextX, nextY) = (blueBall.x + dx[howToMove], blueBall.y + dy[howToMove])
        while canMove(pos: (nextX, nextY)) {
            graph[blueBall.y][blueBall.x] = .empty
            blueBall.x = nextX
            blueBall.y = nextY
            graph[blueBall.y][blueBall.x] = .blueBall
            if blueBall == hole {
                graph[blueBall.y][blueBall.x] = .hole
                break
            }
            (nextX, nextY) = (blueBall.x + dx[howToMove], blueBall.y + dy[howToMove])
        }
        (nextX, nextY) = (redBall.x + dx[howToMove], redBall.y + dy[howToMove])
        while canMove(pos: (nextX, nextY)) {
            graph[redBall.y][redBall.x] = .empty
            redBall.x = nextX
            redBall.y = nextY
            graph[redBall.y][redBall.x] = .redBall
            if redBall == hole {break}
            (nextX, nextY) = (redBall.x + dx[howToMove], redBall.y + dy[howToMove])
        }
    }
}

var answer = Int.max

var visited = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.max, count: M), count: N), count: M), count: N)
func findWay2(prevWay: Move?, cnt: Int) {

    if redBall == hole || blueBall == hole {
        if blueBall != hole {
            answer = min(answer, cnt)
        }
        return
    }

    let prevGraph = graph
    let prevRed = redBall
    let prevBlue = blueBall

    visited[redBall.y][redBall.x][blueBall.y][blueBall.x] = cnt
//    print("wayTo: \(prevWay), count: \(cnt)")
//    graph.forEach({print($0)})


    for way in Move.allCases where way != prevWay && way != prevWay?.reverse() {
        move(to: way)
        if visited[redBall.y][redBall.x][blueBall.y][blueBall.x] > cnt {
            findWay2(prevWay: way, cnt: cnt+1)
        }
        graph = prevGraph
        redBall = prevRed
        blueBall = prevBlue
    }

}

findWay2(prevWay: nil, cnt: 0)
print( answer != Int.max && answer <= 10 ? answer : -1)
