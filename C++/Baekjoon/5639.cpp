#include <iostream>
#include <queue>
#include <stack>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#include <set>
#include <cmath>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned int ui;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

struct Node {
    Node* left = 0;
    Node* right = 0;
    int val = 0;
};

Node bst[10000];
int num_of_bst = 1;

void insert_bst(int push) {
    Node* root = bst;
    Node* temp = &bst[num_of_bst++];
    temp->val = push;
    
    while (1) {
        if(root->val > temp->val) {
            if(root->left) root = root->left;
            else {root->left = temp; return;}
        } else if(root->val < temp->val) {
            if(root->right) root = root->right;
            else {root->right = temp; return;}
        }
    }
    
}

void postorder_traversal(Node* root) {
    if(!root) return;
    postorder_traversal(root->left);
    postorder_traversal(root->right);
    cout << root->val << '\n';
}

int main() {
    fast_io
    int a;
    cin >> a;
    bst[0].val = a;
    while (cin >> a) {
        insert_bst(a);
    }
    postorder_traversal(bst);
}
