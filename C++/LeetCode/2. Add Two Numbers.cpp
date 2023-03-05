# include <iostream>
struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* l3 = new ListNode();
        ListNode* result = l3;
        int head = 0;
        while (1) {
            int sum = 0;
            sum += l1 == nullptr ? 0 : l1->val;
            sum += l2 == nullptr ? 0 : l2->val;
            sum += head;
            l3->val = sum % 10;
            head = sum / 10;
            
            l1 = l1 == nullptr ? l1 : l1->next;
            l2 = l2 == nullptr ? l2 : l2->next;
            if(l1 == nullptr && l2 == nullptr) {
                if (head > 0) {
                    l3->next = new ListNode();
                    l3 = l3->next;
                    l3->val = head;
                }
                break;
            }
            l3->next = new ListNode();
            l3 = l3->next;
        }
        return result;
    }
};

int main() {
//    [2,4,3]
//    [5,6,4]
    Solution rr;
    ListNode lst[7] = {ListNode(9), ListNode(9), ListNode(9), ListNode(9), ListNode(9), ListNode(9), ListNode(9)};
    lst[0].next = &lst[1];
    lst[1].next = &lst[2];
    lst[2].next = &lst[3];
    lst[3].next = &lst[4];
    lst[4].next = &lst[5];
    lst[5].next = &lst[6];
    lst[6].next = nullptr;
    ListNode lst2[4] = {ListNode(9), ListNode(9), ListNode(9), ListNode(9)};
    lst2[0].next = &lst2[1];
    lst2[1].next = &lst2[2];
    lst2[2].next = &lst2[3];
    lst2[3].next = nullptr;
    ListNode* result = rr.addTwoNumbers(lst, lst2);
    while (result != nullptr) {
        std::cout << result->val << ' ';
        result = result->next;
    }
    std::cout << std::endl;
    return 0;
}
