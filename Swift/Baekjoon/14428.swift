import Foundation
// MARK: - 보조 클래스
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readOneInt() -> Int {
        var now = read()
        var isPositive = true
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        return Int(now-48) * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}


final class SegmentTree {
    typealias Contains = (id: Int, value: Int)
    var arr: [Contains]
    let size: Int
    
    init(_ array: [Int]) {
        let n = array.count
        var power = 1
        while power < n {
            power *= 2
        }
        
        
        self.arr = [(Int, Int)](repeating: (0, Int.max), count: 2*power)
        self.size = power
        
        for i in 0..<array.count {
            arr[power+i] = (i+1, array[i])
        }
        
        for i in (1..<power).reversed() {
            if arr[2*i].value <= arr[2*i+1].value {
                arr[i] = arr[2*i]
            } else {
                arr[i] = arr[2*i+1]
            }
        }
    }
    
    func change(_ idx: Int, num: Int) {
        var base = size + idx - 1
        arr[base] = (idx, num)
        while base > 1 {
            base /= 2
            if arr[2*base].value <= arr[2*base+1].value {
                arr[base] = arr[2*base]
            } else {
                arr[base] = arr[2*base+1]
            }
        }
    }
    
    func find(_ idx: Int, _ start: Int, _ end: Int, _ tStart: Int, _ tEnd: Int) -> Contains {
        
        if end < tStart || start > tEnd {
            return (Int.max, Int.max)
        }
        
        if start >= tStart && end <= tEnd {
            return arr[idx]
        }
        
        let mid = (start + end) / 2
        let left = find(idx*2, start, mid, tStart, tEnd)
        let right = find(idx*2+1, mid+1, end, tStart, tEnd)
        if left.value < right.value {
            return left
        } else if left.value == right.value {
            if left.id <= right.id { return left }
            else { return right }
        } else {
            return right
        }
    }
}

let readHelper = FileIO()
let N = readHelper.readInt()
var arr = [Int](repeating: 0, count: N)
for i in 0..<N {
    arr[i] = readHelper.readInt()
}
let seg = SegmentTree(arr)
var M = readHelper.readInt()
var result = ""
while M > 0 {
    M -= 1
    if readHelper.readInt() == 1 {
        seg.change(readHelper.readInt(), num: readHelper.readInt())
    } else {
        result += "\(seg.find(1, 1, seg.size, readHelper.readInt(), readHelper.readInt()).id)\n"
    }
}

print(result)
