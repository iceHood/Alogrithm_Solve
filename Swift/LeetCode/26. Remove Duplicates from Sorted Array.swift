//import Foundation
//
//func address(of object: UnsafeRawPointer) -> String{
//    let address = Int(bitPattern: object)
//    return String(format: "%p", address)
//}
//
//class Solution {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        nums = Array(Set(nums)).sorted()
//        return nums.count
//    }
//}
//
//var arr = [0,0,1,1,1,2,2,3,3,4]
//print(address(of: &arr))
//print(Solution().removeDuplicates(&arr))
//print(address(of: &arr))
//
