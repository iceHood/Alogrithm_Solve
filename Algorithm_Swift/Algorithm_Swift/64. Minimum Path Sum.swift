//class Solution {
//    func minPathSum(_ grid: [[Int]]) -> Int {
//        grid.reduce(into: [[Int]]()) { outArr, arr in
//            outArr.append(arr.enumerated().reduce(into: [Int]()) { (inArr, arg1) in
//                let (idx, num) = arg1
//                if let upArr = outArr.last {
//                    inArr.append(min(num + (inArr.last ?? upArr[idx]) , num + (upArr[idx])))
//                } else {
//                    inArr.append(num + (inArr.last ?? 0))
//                }
//            })
//        }[grid.count-1][grid[0].count-1]
//    }
//}
////var grid = [[1,3,1],[1,5,1],[4,2,1]]
////var grid = [[1,2,3],[4,5,6]]
//var grid = [[1,2],[1,1]]
//print(Solution().minPathSum(grid))
