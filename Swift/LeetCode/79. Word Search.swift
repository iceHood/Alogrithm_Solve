//class Solution {
//    
//    let dy = [0, 0, 1, -1]
//    let dx = [1, -1, 0, 0]
//    
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        
//        var word = Array(word)
//        var visited = [[Int]](repeating: [Int](repeating: 0, count: board[0].count), count: board.count)
//        
//        func visit(y: Int, x: Int, turn wordIdx: Int) -> Bool {
//            if wordIdx >= word.count { return true }
//            if y < 0 || y >= visited.count || x < 0 || x >= visited[0].count { return false }
//            if board[y][x] != word[wordIdx] || visited[y][x] == 1 { return false }
//            visited[y][x] = 1
//            for i in 0...3 {
//                if visit(y: y + dy[i], x: x + dx[i], turn: wordIdx + 1) {
//                    return true
//                }
//            }
//            visited[y][x] = 0
//            return false
//        }
//        for i in 0..<board.count {
//            for t in 0..<board[0].count {
//                if visit(y: i, x: t, turn: 0) {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//}
//
////var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
////var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
//var board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
//print(Solution().exist(board, word))
