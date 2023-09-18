class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        enum Rg {
            case start(Int)
            case end(Int)
        }

        var inter = intervals
        inter.append(newInterval)
        var arr = inter.reduce(into: [Rg]()) { partialResult, value in
            partialResult.append(.start(value[0]))
            partialResult.append(.end(value[1]))
        }

        arr.sort { first, second in
            switch first {
            case .start(let x):
                switch second {
                case .start(let y):
                    return x < y
                case .end(let y):
                    return x <= y
                }
            case .end(let x):
                switch second {
                case .start(let y):
                    return x < y
                case .end(let y):
                    return x < y
                }
            }
        }

        var marker = 0
        var temp: [Int] = []
        var result: [[Int]] = []

        for value in arr {
            switch value {
            case .start(let y):
                marker += 1
                if temp.isEmpty { temp.append(y) }
            case .end(let y):
                marker -= 1
                if marker == 0 { temp.append(y) }
            }
            if temp.count == 2 {
                result.append(temp)
                temp = []
            }
        }

        return result
    }
}

var intervals = [[1,5],[6,8]], newInerval = [0,9]
print(Solution().insert(intervals, newInerval))
