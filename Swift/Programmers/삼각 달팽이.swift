import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = [[Int]](repeating: [], count: n)
    for i in 0..<n {
        arr[i] = [Int](repeating: 0, count: i+1)
    }
    var i = 0, j = 0, value = 1
    var dir = 0
    var limit = n
    var count = 0
    while limit != 0 {
        arr[i][j] = value
        value += 1
        count += 1
        if count == limit {
            limit -= 1
            count = 0
            dir = (dir + 1) % 3
        }
        if dir == 0 { //down
            i += 1
        } else if dir == 1 { //right
            j += 1
        } else { //up
            i -= 1
            j -= 1
        }
        
    }
    return arr.flatMap({$0})
}
