class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var ways = [[Int]](repeating: [Int](repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        // set base point
        ways[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0
        for y in 0..<obstacleGrid.count {
            for x in 0..<obstacleGrid[y].count {
                // pass first item
                guard y != 0 || x != 0 else {continue}
                let above = y > 0 ? ways[y-1][x] : 0
                let left = x > 0 ? ways[y][x-1] : 0
                // set ways if I can go there
                guard obstacleGrid[y][x] == 0 else {continue}
                ways[y][x] = above + left
            }
        }
        // return last element
        return ways[ways.count-1][ways[0].count-1]
    }
}

//var obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
var obstacleGrid = [[0,1],[0,0]]
print(Solution().uniquePathsWithObstacles(obstacleGrid))
