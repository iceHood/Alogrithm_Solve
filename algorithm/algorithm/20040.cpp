#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int root[500000], height[500000], n, m;

int find_root(int start) {
    return root[start] == start ? start : root[start] = find_root(root[start]);
}

bool unite_tree(int a, int b) {
    a = find_root(a); b = find_root(b);
    if(a == b) return true;
    if(height[a] < height[b]) swap(a, b);
    root[b] = a;
    if(height[a] == height[b])
        height[a]++;
    return false;
}


int main() {
    fast_io
    cin >> n >> m;
    
    for(int i = 0 ; i < n ; i++) {
        root[i] = i;
        height[i] = 1;
    }
    
    for(int i = 1 ; i <= m ; i++) {
        int a, b;
        cin >> a >> b;
        if(unite_tree(a, b)) { cout << i ; return 0;}
    }
    
    cout << 0;
    return 0;
}
