//public class Node {
//    public var val: Int
//    public var next: Node?
//    public var random: Node?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//        self.random = nil
//    }
//}
//
//
//class Solution {
//    func copyRandomList(_ head: Node?) -> Node? {
//        if head == nil {
//            return nil
//        }
//        var nodeDict = [UnsafeMutableRawPointer: Int]()
//        var answer = [Node?]()
//        var temp = head
//        var idx = 0
//        while temp != nil {
//            answer.append(Node(temp!.val))
//            nodeDict[Unmanaged.passUnretained(temp!).toOpaque()] = idx
//            idx += 1
//            temp = temp?.next
//        }
//        temp = head
//        idx = 0
//        while temp != nil {
//            if idx + 1 < answer.count {
//                answer[idx]!.next = answer[idx+1]
//            }
//            if var rand = temp?.random {
//                answer[idx]!.random = answer[nodeDict[Unmanaged.passUnretained(rand).toOpaque()]!]
//            }
//            temp = temp?.next
//            idx += 1
//        }
//        return answer[0]
//    }
//}
//
//var nodes = [Node(7),Node(13),Node(11),Node(10),Node(1)]
//for node in 0..<nodes.count-1 {
//    nodes[node].next = nodes[node+1]
//}
//nodes[1].random = nodes[0]
//nodes[2].random = nodes[4]
//nodes[3].random = nodes[2]
//nodes[4].random = nodes[0]
//var head = Solution().copyRandomList(nodes[0])
//while head != nil {
//    print(head?.val, head?.random?.val)
//    head = head?.next
//}
