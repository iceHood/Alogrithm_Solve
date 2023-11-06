final class SeatManager {

    private struct MinHeap {
        var buffer: [Int]
        var capacity: Int
        var count: Int = 0
        
        init(_ n: Int) {
            self.buffer = [0] + (1...n)
            self.capacity = n
            self.count = n
        }
        
        var top: Int {
            buffer[1]
        }
        
        mutating func push(_ n: Int) {
            if count == capacity {
                self.capacity *= 2
                var newBuff = [Int](repeating: .max, count: capacity + 1)
                for i in 0..<self.buffer.count { newBuff[i] = self.buffer[i] }
                self.buffer = newBuff
            }
            var idx = count + 1
            self.buffer[idx] = n
            while idx != 1 && buffer[idx] < buffer[idx/2] {
                buffer.swapAt(idx, idx/2)
                idx /= 2
            }
            count += 1
        }
        
        mutating func pop() -> Int {
            if count == 0 { return 0 }
            var ans = self.top
            buffer.swapAt(1, count)
            buffer[count] = .max
            count -= 1
            var idx = 1
            while idx * 2 <= count {
                if buffer[idx] < buffer[idx * 2] && buffer[idx] < buffer[idx * 2 + 1] { break }
                else if buffer[idx * 2] > buffer[idx * 2 + 1] {
                    buffer.swapAt(idx, idx * 2 + 1)
                    idx = idx * 2 + 1
                } else {
                    buffer.swapAt(idx, idx * 2)
                    idx = idx * 2
                }
            }
            return ans
        }
    }
    
    private var heap: MinHeap
    
    init(_ n: Int) {
        heap = .init(n)
    }
    
    func reserve() -> Int {
        heap.pop()
    }
    
    func unreserve(_ seatNumber: Int) {
        heap.push(seatNumber)
    }
}
SeatManager(3)
/**
 * Your SeatManager object will be instantiated and called as such:
 * let obj = SeatManager(n)
 * let ret_1: Int = obj.reserve()
 * obj.unreserve(seatNumber)
 */
