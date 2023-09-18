class Solution {
    typealias Cor = (y: Int, x: Int)
    func rotate(_ matrix: inout [[Int]]) {
        var n = matrix.count
        var count = 0
        var startPos: Cor = (y: 0, x: 0)
        var nowPos: Cor = startPos
        var prevNum = matrix[startPos.y][startPos.x]
        
        while n > 1 {
            var moveCount = n - 1
            var nextPos: Cor = nowPos
            while moveCount != 0 {
                switch nextPos {
                case (count, ..<(matrix.count - count - 1)):
                    let moveX = abs(nextPos.x - (matrix.count - count - 1))
                    nextPos.x += moveX
                    moveCount -= moveX
                    if moveCount < 0 { nextPos.x += moveCount; moveCount = 0}
                case (..<(matrix.count - count - 1), matrix.count - count - 1):
                    let moveY = abs(nextPos.y - (matrix.count - count - 1))
                    nextPos.y +=  moveY
                    moveCount -= moveY
                    if moveCount < 0 { nextPos.y += moveCount; moveCount = 0}
                case (matrix.count - count - 1, (count+1)...):
                    let moveX = abs(nextPos.x - count)
                    nextPos.x -= moveX
                    moveCount -= moveX
                    if moveCount < 0 { nextPos.x -= moveCount; moveCount = 0}
                case ((count+1)..., count):
                    let moveY = abs(nextPos.y - count)
                    nextPos.y -=  moveY
                    moveCount -= moveY
                    if moveCount < 0 { nextPos.y -= moveCount; moveCount = 0}
                default:
                    break
                }
            }
            var tempNum = matrix[nextPos.y][nextPos.x]
            matrix[nextPos.y][nextPos.x] = prevNum
            prevNum = tempNum
            nowPos = nextPos
            if nowPos == startPos {
                startPos.x += 1
                nowPos.x += 1
                prevNum = matrix[nowPos.y][nowPos.x]
            }
            
            if startPos.x == matrix.count - 1 - count {
                startPos = (count + 1, count + 1)
                nowPos = startPos
                n -= 2
                count += 1
                prevNum = matrix[nowPos.y][nowPos.x]
            }
        }
    }
}

//var matrix = [[1,2,3],[4,5,6],[7,8,9]]
//var matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
var matrix = [[5,1,9,11,4],[2,4,8,10,52],[13,3,6,7,15],[15,14,12,16,55],[43,22,123,53,-55]]
Solution().rotate(&matrix)
print(matrix)

