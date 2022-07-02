#include <iostream>
#include <stack>
#include <algorithm>
using namespace std;

class Node {
public:
    int data;
    Node* left;
    Node* right;
};

int N;
int idx = 0;
stack<int> s;
Node nodes[100000];
int v[100000];

void sol(int start, int end, Node*& p) {
    if (start == end) return;
    if (s.empty()) return;
    
    int mid = s.top();
    int midIdx = find(v + start, v + end, mid) - v;
    s.pop();
    nodes[idx].data = v[midIdx];
    p = &nodes[idx++];
    
    sol(midIdx + 1, end, p->right);
    sol(start, midIdx, p->left);
}

void preSearch(Node* p) {
    if (p == nullptr) {
        return;
    }
    cout << p->data << ' ';
    preSearch(p->left);
    preSearch(p->right);
}

int main() {
    cin >> N;
    for (int i = 0; i < N; i++) {
        int temp;
        scanf("%d", &temp);
        v[i] = temp;
    }
    for (int i = 0; i < N; i++) {
        int temp;
        scanf("%d", &temp);
        s.push(temp);
    }
    
    int start = 0;
    int end = N;
    int mid = s.top();
    int midIdx = find(v + start, v + end, mid) - v;
    
    s.pop();
    nodes[idx++].data = v[midIdx];
    Node* nPtr = &nodes[0];
    
    if (midIdx != end - 1) sol(midIdx + 1, end, nPtr->right);
    if (start != midIdx) sol(start, midIdx, nPtr->left);
    
    preSearch(nPtr);
    return 0;
}
