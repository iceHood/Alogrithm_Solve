//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
//
//@resultBuilder
//enum ArrayBuilder {
//    typealias Component = Int
//    static func buildBlock(_ components: Component...) -> [Component] {
//        return components
//    }
//}
//
//@resultBuilder
//enum LinkedListBuilder {
//    
//    typealias Component = ListNode
//    
//    static func buildBlock(_ components: Component...) -> Component {
//        if components.count == 1 {
//            return components[0]
//        } else {
//            var head = components.first!
//            var temp = head
//            for i in 1..<components.count {
//                temp.next = components[i]
//                temp = temp.next!
//            }
//            return head
//        }
//    }
//    
//    static func buildArray(_ components: [LinkedListBuilder.Component]) -> LinkedListBuilder.Component {
//        if components.count == 1 {
//            return components[0]
//        } else {
//            var head = components.first!
//            var temp = head
//            for i in 1..<components.count {
//                temp.next = components[i]
//                temp = temp.next!
//            }
//            return head
//        }
//    }
//}
//
//struct LinkedList {
//    @LinkedListBuilder
//    public static func makeLinkedList(_ values: [Int]) -> ListNode {
//        for value in values {
//            ListNode(value)
//        }
//    }
//    
//    @LinkedListBuilder
//    public static func makeLinkedList(_ value: Int) -> ListNode {
//        ListNode(value)
//    }
//
//    @LinkedListBuilder
//    public static func makeLinkedList(@ArrayBuilder _ values: () -> [Int]) -> ListNode {
//        makeLinkedList(values())
//    }
//}
//
//
//class Solution {
//    func reorderList(_ head: ListNode?) {
//        var arr = [ListNode]()
//        var head = head
//        while head != nil {
//            arr.append(head!)
//            head = head?.next
//        }
//        
//        if arr.count == 1 {
//            return
//        }
//        
//        var answer: ListNode = arr[0]
//        var left = 1, right = arr.count-1
//        while left <= right {
//            answer.next = arr[right]
//            answer = answer.next!
//            answer.next = nil
//            right -= 1
//            guard left <= right else { break }
//            answer.next = arr[left]
//            answer = answer.next!
//            answer.next = nil
//            left += 1
//        }
//        return
//    }
//}
//
//var head: ListNode? = LinkedList.makeLinkedList{
//    1
//    2
//    3
//    4
//}
//Solution().reorderList(head)
//while head != nil {
//    print(head!.val)
//    head = head?.next
//}
//head = LinkedList.makeLinkedList{
//    1
//    2
//    3
//    4
//    5
//}
//Solution().reorderList(head)
//while head != nil {
//    print(head!.val)
//    head = head?.next
//}
