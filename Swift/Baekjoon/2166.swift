
//1. 벡터의 외적으로 구하기
// 1.1 sum = (|(x2-x1)(y3-y1)-(x3-x1)(y2-y1)|)/2 로 나타낼 수 있음
//     여기서 x1,y1  x2,y2  x3,y3는 각각 점을 의미함
//2. 다각형 -> 3각형으로 나누기
// 2.1 y값이 가장 높은 점을 기준으로 x값이 낮은 순서대로 나누어 버리기
import Foundation

@usableFromInline
typealias Point = (x: Int, y: Int)

@inlinable
func triangleAreaWithVector(_ first: Point, _ second: Point, _ third: Point) -> Double {
    abs(Double((second.x-first.x)*(third.y-first.y)-(third.x-first.x)*(second.y-first.y)))/2.0
}
//계산을 해보니 위의 식은 오목한 부분이 있을 때 제대로 동작하지 않는다.
// 그래서 고등학교 때 잘 써먹은 공식을 적용해보기로 하였다. (신발끈인가 뭔가..)
// |x1*y2 + x2*y3 + ... xn*y1 - x1*yn - xn*yn-1 - ... - x2*y1| / 2
// 위의 식에서 절대값 내부만 우선 계산
@inlinable
func plusMinus(_ first: Point, _ second: Point) -> Int {
    first.x*second.y - second.x*first.y
}

let N = Int(readLine()!)!
var arr = [Point]()
for _ in 0..<N {
    let read = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((read[0], read[1]))
}

// 더 좋은 방법이 없을까
// 1. y기준으로 정렬해서 가장 높은 값을 pop하여 base로 설정
// 2. x기준으로 정렬해서 가장 높은 값부터 차례대로 계산
/*
arr.sort { $0.y < $1.y }
let basePoint = arr.popLast()!
arr.sort { $0.x < $1.x }
var sum: Double = 0
for i in 0..<arr.count-1 {
    sum += triangleAreaWithVector(basePoint, arr[i], arr[i+1])
}
print(String(format: "%.1f", sum))
 */
// 1. 배열의 마지막에 첫번째 point를 추가로 삽입하여 계산을 진행
arr.append(arr.first!)
var sum = 0
for i in 0..<arr.count-1 {
    sum += plusMinus(arr[i], arr[i+1])
}
print(String(format: "%.1f", abs(Double(sum)/2)))
