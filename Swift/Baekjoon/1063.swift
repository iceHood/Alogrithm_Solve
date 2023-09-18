typealias Coordinate = (x: Int, y: Int)

enum Horse {
    case king(coordinate: Coordinate)
    case stone(coordinate: Coordinate)
}

var readed = readLine()!.split(separator: " ").map { String($0) }

let (king, stone, n) = (readed[0], readed[1], Int(readed[2])!)

let move: [String: (dx: Int, dy: Int)] = ["R": (1, 0), "L": (-1, 0), "B": (0, -1), "T": (0, 1), "RT": (1, 1), "LT": (-1, 1), "RB": (1, -1), "LB": (-1, -1)]

let alphaToInt = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
let intToAlpha = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H"]

var kingPos: Horse = Horse.king(coordinate: (alphaToInt[String(king.first!)]!, Int(String(king.last!))!))

var stonePos: Horse = Horse.stone(coordinate: (alphaToInt[String(stone.first!)]!, Int(String(stone.last!))!))

func isValidLocation(coordinate: Coordinate) -> Bool {
    return 1...8 ~= coordinate.x && 1...8 ~= coordinate.y
}

@discardableResult
func moveOrder(horse: Horse, command: String) -> Bool {
    switch horse {
    case var .king(coordinate: nextPos):
        nextPos = (nextPos.x + move[command]!.dx, nextPos.y + move[command]!.dy)
        if case Horse.stone(coordinate: let sPos) = stonePos, sPos == nextPos {
            if moveOrder(horse: stonePos, command: command) {
                kingPos = .king(coordinate: nextPos)
                return true
            } else {return false}
        } else if isValidLocation(coordinate: nextPos) {
            kingPos = .king(coordinate: nextPos)
            return true
        } else { return false }
    case var .stone(coordinate: nextPos):
        nextPos = (nextPos.x + move[command]!.dx, nextPos.y + move[command]!.dy)
        if isValidLocation(coordinate: nextPos) {
            stonePos = .stone(coordinate: nextPos)
            return true
        } else { return false }
    }
}

func printResult() {
    guard case let Horse.king(coordinate: kPos) = kingPos else {return}
    guard case let Horse.stone(coordinate: sPos) = stonePos else {return}

    let stringKPos = intToAlpha[kPos.x]! + String(kPos.y)
    let stringSPos = intToAlpha[sPos.x]! + String(sPos.y)

    print(stringKPos)
    print(stringSPos)
}

for _ in 1...n {
    let command = readLine()!
    moveOrder(horse: kingPos, command: command)
}
printResult()


