import Foundation

func solution(_ cards:[Int]) -> Int {
    var cards = cards
    var results = [Int]()
    
    while true {
        var idx = 0
        var count = 0
        while idx < cards.count {
            if cards[idx] != 0 { break }
            idx += 1
        }
        if idx == cards.count { break }
        while cards[idx] != 0 {
            let next = cards[idx]
            cards[idx] = 0
            idx = next-1
            count += 1
        }
        results.append(count)
    }
    
    results.sort(by: >)
    
    if results.count <= 1 {
        return 0
    } else {
        return results[0] * results[1]
    }
}
