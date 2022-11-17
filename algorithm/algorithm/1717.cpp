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

int n, m;
int parent[1000001];

int find_root(int start) {
    if(parent[start] == start) return start;
    else return parent[start] = find_root(parent[start]);
}

void union_set(int a, int b) {
    a = find_root(a); b = find_root(b);
    if(parent[a] < parent[b]) swap(a, b);
    parent[b] = a;
}

int main() {
    fast_io
    cin >> n >> m;
    for(int i = 1 ; i <= n ; i++) parent[i] = i;
    for(int i = 0 ; i < m ; i++) {
        int token, a, b;
        cin >> token >> a >> b;
        if(token) {
            cout << (find_root(a) == find_root(b) ? "YES" : "NO") << '\n';
        } else {
            union_set(a, b);
        }
    }
}
