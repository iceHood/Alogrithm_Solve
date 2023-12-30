
class MyStack {

    var arr = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        arr.append(x)
    }
    
    func pop() -> Int {
        arr.popLast()!
    }
    
    func top() -> Int {
        arr.last!
    }
    
    func empty() -> Bool {
        arr.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
