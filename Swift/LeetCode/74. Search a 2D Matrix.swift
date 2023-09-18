class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        
        var left = 0
        var right = m * n - 1
        var middle = (left + right) / 2
        while left <= right {
            middle = (left + right) / 2
            if matrix[middle / n][middle % n] < target {
                left = middle + 1
            } else if matrix[middle / n][middle % n] > target {
                right = middle - 1
            } else if matrix[middle / n][middle % n] == target{
                return true
            }
        }
        return false
    }
}

//var matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
var matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
print(Solution().searchMatrix(matrix, target))
