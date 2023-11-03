class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var answer = [String]()
        var temp = 1
        for num in target {
            while temp < num {
                answer.append("Push")
                answer.append("Pop")
                temp += 1
            }
            answer.append("Push")
            temp += 1
        }
        return answer
    }
    func buildArray2(_ target: [Int], _ n: Int) -> [String] {
        let last = target[target.count-1]
        var answer = [String?]()
        for _ in 0..<last {
            answer.append("Push")
            answer.append(nil)
        }
        var temp = 1
        for num in target {
            while temp < num {
                answer[temp * 2 - 1] = "Pop"
                temp += 1
            }
            temp += 1
        }
        return answer.compactMap { $0 }
    }
}
