//class Solution {
//    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
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
//        var result = [Int]()
//
//        while count > 0 {
//            while x < upToRight {
//                result.append(matrix[y][x])
//                x += 1
//                count -= 1
//            }
//            upToRight -= 1
//            guard count > 0 else {break}
//            x -= 1
//            y += 1
//            while y < upToBottom {
//                result.append(matrix[y][x])
//                y += 1
//                count -= 1
//            }
//            upToBottom -= 1
//            guard count > 0 else {break}
//
//            y -= 1
//            x -= 1
//            while x >= throughLeft {
//                result.append(matrix[y][x])
//                x -= 1
//                count -= 1
//            }
//            throughLeft += 1
//            guard count > 0 else {break}
//
//            y -= 1
//            x += 1
//            while y >= throughTop {
//                result.append(matrix[y][x])
//                y -= 1
//                count -= 1
//            }
//            throughTop += 1
//            guard count > 0 else {break}
//
//            y += 1
//            x += 1
//        }
//        return result
//    }
//}
//
////var matrix = [[1,2,3],[4,5,6],[7,8,9]]
//var matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
//print(Solution().spiralOrder(matrix))
