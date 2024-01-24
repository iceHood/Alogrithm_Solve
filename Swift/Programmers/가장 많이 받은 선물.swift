import Foundation

final class User {
    var name: String = ""
    var giftTo: [String: Int] = [:]
    var totalGetNum: Int = 0
    var totalGiveNum: Int = 0
    var giftDegree: Int {
        totalGiveNum - totalGetNum
    }
    init(_ name: String) {
        self.name = name
        self.giftTo = [:]
        self.totalGetNum = 0
        self.totalGiveNum = 0 
    }
    
    func giveGift(to name: String) {
        if let num = giftTo[name] {
            giftTo[name] = num + 1
        } else {
            giftTo[name] = 1
        }
        totalGiveNum += 1
    }
    
    func getGift() {
        totalGetNum += 1
    }
    
    func howManyGive(to name: String) -> Int {
        giftTo[name] ?? 0
    }
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var users = [String: User]()
    for friend in friends {
        users[friend] = User(friend)
    }
    for gift in gifts {
        let gift = gift.split(separator:" ")
        let from = String(gift[0])
        let to = String(gift[1])
        
        users[from]?.giveGift(to: to)
        users[to]?.getGift()
    }
    
    var results = [Int](repeating: 0, count: friends.count)
    for i in 0..<friends.count {
        let a = users[friends[i]]!
        for j in (i+1)..<friends.count {
            let b = users[friends[j]]!
            let aToB = a.howManyGive(to: b.name)
            let bToA = b.howManyGive(to: a.name)
            if aToB < bToA {
                results[j] += 1
            } else if aToB > bToA {
                results[i] += 1
            } else if a.giftDegree < b.giftDegree {
                results[j] += 1
            } else if a.giftDegree > b.giftDegree {
                results[i] += 1
            }
        }
    }
    
    return results.max()!
}
