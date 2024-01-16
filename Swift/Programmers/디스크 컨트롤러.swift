import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var schedule = [Int: [Int]]()
    var currentTime = 0
    var result = 0
    
    for job in jobs {
        if schedule[job[0]] != nil {
            schedule[job[0]]?.append(job[1])
        } else {
            schedule[job[0]] = [job[1]]
        }
    }
    
    for at in schedule.keys {
        schedule[at]?.sort(by: >)
    }
    
    while !schedule.isEmpty {
        var minTime = Int.max
        var minAt = Int.max
        for at in schedule.keys.sorted() where at <= currentTime {
            let now = schedule[at]?.last ?? Int.max
            if minTime > now {
                minTime = now
                minAt = at
            }
        }
        if minAt == Int.max {
            currentTime += 1
            continue
        }
        schedule[minAt]?.popLast()
        if schedule[minAt]?.isEmpty == true { schedule[minAt] = nil }
        currentTime += minTime
        result += currentTime - minAt
    }
    
    return result / jobs.count
}
