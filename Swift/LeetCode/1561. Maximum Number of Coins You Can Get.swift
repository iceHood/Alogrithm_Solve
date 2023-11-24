class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        let piles = piles.sorted()
        var myTurn = piles.count - 2
        var bob = 0
        var result = 0
        while bob < myTurn {
            result += piles[myTurn]
            myTurn -= 2
            bob += 1
        }
        return result
    }
}
