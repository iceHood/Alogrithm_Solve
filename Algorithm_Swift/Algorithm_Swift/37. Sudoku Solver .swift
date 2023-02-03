////class Solution {
////    static let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
////
////    func solveSudoku(_ board: inout [[Character]]) {
////        var horizental = [Self.numbers,Self.numbers,Self.numbers,
////                          Self.numbers,Self.numbers,Self.numbers,
////                          Self.numbers,Self.numbers,Self.numbers]
////        var vertical = [Self.numbers,Self.numbers,Self.numbers,
////                        Self.numbers,Self.numbers,Self.numbers,
////                        Self.numbers,Self.numbers,Self.numbers]
////        var numberPad = [Self.numbers,Self.numbers,Self.numbers,
////                         Self.numbers,Self.numbers,Self.numbers,
////                         Self.numbers,Self.numbers,Self.numbers]
////
////        for h in 0...8 {
////            for v in 0...8 {
////                let token = board[h][v]
////                if token != "." {
////                    let num = Int(String(token))!
////                    horizental[h][num-1] = -1
////                    vertical[v][num-1] = -1
////                    numberPad[h/3*3 + v/3][num-1] = -1
////                }
////            }
////        }
////        var horizentalSet = horizental.map { Set($0.filter{$0 != -1}) }
////        var verticalSet = vertical.map { Set($0.filter{$0 != -1}) }
////        var numberPadSet = numberPad.map { Set($0.filter{$0 != -1}) }
////
////        var isModified = false
////        repeat {
////            isModified = false
////        OUTER:for h in 0...8 {
////                for v in 0...8 {
////                    if board[h][v] == "." {
////                        let possibleNumber = horizentalSet[h].intersection(verticalSet[v]).intersection(numberPadSet[h/3*3 + v/3])
////                        if possibleNumber.count == 1 {
////                            let num = possibleNumber.first!
////                            isModified = true
////                            board[h][v] = Character("\(num)")
////                            horizentalSet[h].remove(num)
////                            verticalSet[v].remove(num)
////                            numberPadSet[h/3*3 + v/3].remove(num)
////                            break OUTER
////                        }
////                    }
////                }
////            }
////        } while isModified
////    }
////}
////
////var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
////
////Solution().solveSudoku(&board)
////print(board)
//
//class Solution {
//    private var row = Array(repeating: Array(repeating: 0, count: 10), count: 9)
//    private var col = Array(repeating: Array(repeating: 0, count: 10), count: 9)
//    private var cube = Array(repeating: Array(repeating: Array(repeating: 0, count: 10), count: 3), count: 3)
//
//    func solveSudoku(_ board: inout [[Character]]) {
//        row = Array(repeating: Array(repeating: 0, count: 10), count: 9)
//        col = Array(repeating: Array(repeating: 0, count: 10), count: 9)
//        cube = Array(repeating: Array(repeating: Array(repeating: 0, count: 10), count: 3), count: 3)
//
//        for r in 0..<9 {
//            for c in 0..<9 {
//                if board[r][c] != "." {
//                    let d = Int(String(board[r][c]))!
//                    row[r][d] = 1
//                    col[c][d] = 1
//                    cube[r/3][c/3][d] = 1
//                }
//            }
//        }
//
//        _ = solveSudoku(&board, 0, 0)
//    }
//
//    private func check(_ board: inout [[Character]], _ r: Int, _ c: Int, _ val: Int) -> Bool {
//        if row[r][val] == 1 {
//            return false
//        }
//        if col[c][val] == 1 {
//            return false
//        }
//        if cube[r/3][c/3][val] == 1 {
//            return false
//        }
//        return true
//    }
//
//    private func solveSudoku(_ board: inout [[Character]], _ i: Int, _ j: Int) -> Bool {
//        if i == 9 {
//            return true
//        }
//        if j == 9 {
//            return solveSudoku(&board, i+1, 0)
//        }
//        if board[i][j] != "." {
//            return solveSudoku(&board, i, j+1)
//        }
//
//        for d in 1...9 {
//            let charD = Character(String(d))
//            if check(&board, i, j, d) {
//                board[i][j] = charD
//                row[i][d] = 1
//                col[j][d] = 1
//                cube[i/3][j/3][d] = 1
//                if solveSudoku(&board, i, j+1) {
//                    return true
//                }
//                board[i][j] = "."
//                row[i][d] = 0
//                col[j][d] = 0
//                cube[i/3][j/3][d] = 0
//            }
//        }
//
//        return false
//    }
//}
//
//var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
//
//Solution().solveSudoku(&board)
//print(board)
