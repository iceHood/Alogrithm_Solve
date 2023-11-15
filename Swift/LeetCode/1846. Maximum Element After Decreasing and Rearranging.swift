class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        var arr = arr.sorted()
        arr[0] = 1
        for i in 1..<arr.count {
            if abs(arr[i]-arr[i-1]) > 1 {
                arr[i] = arr[i-1] + 1
            }
        }
        return arr[arr.count-1]
    }
}
