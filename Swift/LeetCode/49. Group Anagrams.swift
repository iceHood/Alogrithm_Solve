class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        strs.enumerated().reduce(into: [[Character]:[Int]]()) { (partialResult, arg1) in
            let (idx, str) = arg1
            let key = str.sorted()
            if partialResult[key] != nil {
                partialResult[key]!.append(idx)
            } else {
                partialResult[key] = [idx]
            }
        }.reduce(into: [[String]]()) { partialResult, arg in
            var arr = [String]()
            arr.append(contentsOf: arg.value.map({ i in strs[i]}))
            partialResult.append(arr)
        }
    }
}

//var strs = ["eat","tea","tan","ate","nat","bat"]
//var strs = [""]
var strs = ["a"]
print(Solution().groupAnagrams(strs))
