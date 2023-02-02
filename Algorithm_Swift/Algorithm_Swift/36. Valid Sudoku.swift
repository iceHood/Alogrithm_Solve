//class Solution {
//
//    func isValid(_ arr: [Int]) -> Bool {
//        return arr.count == Set(arr).count
//    }
//
//    func isValidSudoku(_ board: [[Character]]) -> Bool {
//        var horizental: [[Int]] = [[],[],[],[],[],[],[],[],[]]
//        var vertical: [[Int]] = [[],[],[],[],[],[],[],[],[]]
//        var thirdOf3: [[Int]] = [[],[],[],[],[],[],[],[],[]]
//
//        for h in 0...8 {
//            for v in 0...8 {
//                let ch = board[h][v]
//                if ch != "." {
//                    let num = Int(String(ch))!
//                    horizental[h].append(num)
//                    vertical[v].append(num)
//                    if h < 3 {
//                        if v < 3 {
//                            thirdOf3[0].append(num)
//                        } else if v < 6 {
//                            thirdOf3[1].append(num)
//                        } else if v < 9 {
//                            thirdOf3[2].append(num)
//                        }
//                    } else if h < 6 {
//                        if v < 3 {
//                            thirdOf3[3].append(num)
//                        } else if v < 6 {
//                            thirdOf3[4].append(num)
//                        } else if v < 9 {
//                            thirdOf3[5].append(num)
//                        }
//                    } else if h < 9 {
//                        if v < 3 {
//                            thirdOf3[6].append(num)
//                        } else if v < 6 {
//                            thirdOf3[7].append(num)
//                        } else if v < 9 {
//                            thirdOf3[8].append(num)
//                        }
//                    }
//                }
//            }
//        }
//
//        for i in 0...8 {
//            if !(isValid(horizental[i]) && isValid(vertical[i]) && isValid(thirdOf3[i])) {
//                return false
//            }
//        }
//        return true
//    }
//}
//
//let board: [[Character]] = [["5","3",".",".","7",".",".",".","."]
//             ,["6",".",".","1","9","5",".",".","."]
//             ,[".","9","8",".",".",".",".","6","."]
//             ,["8",".",".",".","6",".",".",".","3"]
//             ,["4",".",".","8",".","3",".",".","1"]
//             ,["7",".",".",".","2",".",".",".","6"]
//             ,[".","6",".",".",".",".","2","8","."]
//             ,[".",".",".","4","1","9",".",".","5"]
//             ,[".",".",".",".","8",".",".","7","9"]]
//
//let board2: [[Character]] = [["8","3",".",".","7",".",".",".","."]
//,["6",".",".","1","9","5",".",".","."]
//,[".","9","8",".",".",".",".","6","."]
//,["8",".",".",".","6",".",".",".","3"]
//,["4",".",".","8",".","3",".",".","1"]
//,["7",".",".",".","2",".",".",".","6"]
//,[".","6",".",".",".",".","2","8","."]
//,[".",".",".","4","1","9",".",".","5"]
//,[".",".",".",".","8",".",".","7","9"]]
//
//print(Solution().isValidSudoku(board2))
