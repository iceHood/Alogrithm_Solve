//class MinStack {
//
//    var stack: [(Int,Int)]
//
//    init() {
//        stack = []
//    }
//
//    func push(_ val: Int) {
//        stack.append((val, min(stack.last?.1 ?? Int.max, val)))
//    }
//
//    func pop() {
//        stack.removeLast()
//    }
//
//    func top() -> Int {
//        stack.last!.0
//    }
//
//    func getMin() -> Int {
//        stack.last!.1
//    }
//}
