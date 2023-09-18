
var N = Int(readLine()!)!
var arr = [Int](repeating: 0, count: 10)

var k: Int = 1
var start: Int = 1

func t(x: Int) {
    var x = x
    while x > 0 {
        arr[x % 10] += k
        x /= 10
    }
}

while start <= N {
    while N % 10 != 9 && start <= N {
        t(x: N)
        N -= 1
    }
    if N < start {
        break
    }
    while start % 10 != 0 && start <= N {
        t(x: start)
        start += 1
    }
    start /= 10
    N /= 10
    for i in 0..<10 {
        arr[i] += (N - start + 1 ) * k
    }
    k *= 10
}

arr.forEach({
    print($0, terminator: " ")
})
