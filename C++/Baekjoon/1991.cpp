#include <iostream>
using namespace std;

class Node {
public:
    char data;
    Node* left;
    Node* right;
};

void preSearch(Node* nodePtr) {
    if (nodePtr->data == '.') {
        return;
    }
    cout << nodePtr->data;
    preSearch(nodePtr->left);
    preSearch(nodePtr->right);
}
void midSearch(Node* nodePtr) {
    if (nodePtr->data == '.') {
        return;
    }
    midSearch(nodePtr->left);
    cout << nodePtr->data;
    midSearch(nodePtr->right);
}
void postSearch(Node* nodePtr) {
    if (nodePtr->data == '.') {
        return;
    }
    postSearch(nodePtr->left);
    postSearch(nodePtr->right);
    cout << nodePtr->data;
}
int main() {
    int n;
    cin >> n;
    Node dotNode;
    dotNode.data = '.';
    Node nodes[26];
    
    for (int i = 0; i < n ; i++) {
        char a, b, c;
        cin >> a >> b >> c;
        nodes[a - 'A'].data = a;
        if (b == '.') {
            nodes[a - 'A'].left = &dotNode;
        } else nodes[a - 'A'].left = &nodes[b - 'A'];
        if (c == '.') {
            nodes[a - 'A'].right = &dotNode;
        } else nodes[a - 'A'].right = &nodes[c - 'A'];
    }
    preSearch(&nodes[0]);
    cout << endl;
    midSearch(&nodes[0]);
    cout << endl;
    postSearch(&nodes[0]);
    cout << endl;
    
    return 0;
}
