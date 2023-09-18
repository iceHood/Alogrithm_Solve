import Foundation

var sudoku = [[Int]](repeating: [Int](), count: 9)
for i in 0..<9 {
    sudoku[i] = readLine()!.map { Int(String($0))! }
}

func isValid(y: Int, x: Int, num: Int) -> Bool {
    
    for i in 0..<9 {
        if sudoku[y][i] == num || sudoku[i][x] == num {
            return false
        }
    }
    let baseY = (y / 3) * 3
    let baseX = (x / 3) * 3
    
    for i in baseY..<baseY+3 {
        for j in baseX..<baseX+3 {
            if sudoku[i][j] == num {
                return false
            }
        }
    }
    
    return true
}

func printSudoku() {
    for i in 0..<9 {
        for j in 0..<9 {
            print(sudoku[i][j], terminator: "")
        }
        print()
    }
}
func backTrack(cnt: Int) {
    let y: Int = cnt / 9, x: Int = cnt % 9
    if cnt >= 81 {
        printSudoku()
        exit(0)
    }
    if y < 0 || y >= 9 || x < 0 || x >= 9 { return }
    if sudoku[y][x] != 0 {
        backTrack(cnt: cnt+1)
    } else {
        for num in 1...9 {
            if isValid(y: y, x: x, num: num) {
                sudoku[y][x] = num
                backTrack(cnt: cnt+1)
                sudoku[y][x] = 0
            }
        }
    }
}

backTrack(cnt: 0)
