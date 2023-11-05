class Solution {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        var now = arr[0]
        var temp = 0
        for i in 1..<arr.count {
            if now < arr[i] {
                now = arr[i]
                temp = 1
            } else {
                temp += 1
            }
            if temp == k {
                break
            }
        }
        return now
    }
}
