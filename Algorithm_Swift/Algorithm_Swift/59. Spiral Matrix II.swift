//class Solution {
//    func generateMatrix(_ n: Int) -> [[Int]] {
//        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
//        var upToRight = matrix[0].count
//        var upToBottom = matrix.count
//        var throughLeft = 0
//        var throughTop = 1
//        var count = matrix.reduce(0) { partialResult, arr in
//            partialResult + arr.count
//        }
//
//        var y = 0
//        var x = 0
//        var tempIdx = 1
//
//        while count > 0 {
//            while x < upToRight {
//                matrix[y][x] = tempIdx
//                tempIdx += 1
//                x += 1
//                count -= 1
//            }
//            upToRight -= 1
//            guard count > 0 else {break}
//            x -= 1
//            y += 1
//            while y < upToBottom {
//                matrix[y][x] = tempIdx
//                tempIdx += 1
//                y += 1
//                count -= 1
//            }
//            upToBottom -= 1
//            guard count > 0 else {break}
//
//            y -= 1
//            x -= 1
//            while x >= throughLeft {
//                matrix[y][x] = tempIdx
//                tempIdx += 1
//                x -= 1
//                count -= 1
//            }
//            throughLeft += 1
//            guard count > 0 else {break}
//
//            y -= 1
//            x += 1
//            while y >= throughTop {
//                matrix[y][x] = tempIdx
//                tempIdx += 1
//                y -= 1
//                count -= 1
//            }
//            throughTop += 1
//            guard count > 0 else {break}
//
//            y += 1
//            x += 1
//        }
//        return matrix
//    }
//}
//var answer = Solution().generateMatrix(10)
//answer.forEach { ii in
//    print(ii)
//}
