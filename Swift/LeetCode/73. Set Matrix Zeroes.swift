//class Solution {
//    func setZeroes(_ matrix: inout [[Int]]) {
//        var coordinateY = Set<Int>()
//        var coordinateX = Set<Int>()
//        for i in 0..<matrix.count {
//            for t in 0..<matrix[i].count {
//                if matrix[i][t] == 0 {
//                    coordinateY.insert(i)
//                    coordinateX.insert(t)
//                }
//            }
//        }
//        
//        for i in coordinateY {
//            for t in 0..<matrix[0].count {
//                matrix[i][t] = 0
//            }
//        }
//        for i in coordinateX {
//            for t in 0..<matrix.count {
//                matrix[t][i] = 0
//            }
//        }
//    }
//}
//
////var matrix = [[1,1,1],[1,0,1],[1,1,1]]
//var matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
//
//Solution().setZeroes(&matrix)
//print(matrix)
