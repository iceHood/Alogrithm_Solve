
// 1. 소수 목록을 구한다.
// 2. 소수 목록을 이용하여 합들을 구한다. (n^2 -> n은 소수의 개수)

// 1. 소수 목록 구하기 ~upto 4000000
import Foundation

var sosu = [Int]()
let num = Int(readLine()!)!
func sieveOfEratosthenes(to n: Int) -> [Int] {
    guard n != 1 else { return [] }
    guard n != 2 else { return [2]}
    guard n != 3 else { return [2, 3]}
    var numbers = [Bool](repeating: true, count: n + 1)
    numbers[0] = false
    numbers[1] = false

    for number in 2...Int(sqrt(Double(n))) {
        if numbers[number] {
            for multiple in stride(from: number * number, through: n, by: number) {
                numbers[multiple] = false
            }
        }
    }

    return numbers.enumerated().compactMap { $1 ? $0 : nil }
}
sosu = sieveOfEratosthenes(to: num)

// 2. 소수 목록을 이용하여 합을 구하기

var answer = [Int](repeating: 0, count: num + 1)
for i in 0..<sosu.count {
    var temp = 0
    for t in i..<sosu.count {
        temp += sosu[t]
        if temp > num {
            break
        } else {
            answer[temp] += 1
        }
    }
}
print(answer[num])
