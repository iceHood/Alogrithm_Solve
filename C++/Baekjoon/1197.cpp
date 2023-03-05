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

int V, E;
int parent[10001], height[10001];
vector<pair<int, pii>> edges;

int find_parent(int start) {
    return parent[start] == start ? start : parent[start] = find_parent(parent[start]);
}

bool unite_parent(int a, int b) {
    a = find_parent(a); b = find_parent(b);
    if(a == b) return true;
    if(height[a] < height[b]) swap(a, b);
    parent[b] = a;
    if(height[a] == height[b])
        height[a]++;
    return false;
}

int main() {
    fast_io
    cin >> V >> E;
    for(int i = 1 ; i <= V ; i++) {
        parent[i] = i;
        height[i] = 1;
    }
    for(int i = 0 ; i < E ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        edges.push_back({c, {a, b}});
    }
    sort(edges.begin(), edges.end());
    ll answer = 0;
    for(auto it : edges) {
        if(unite_parent(it.second.first, it.second.second)) continue;
        answer += it.first;
    }
    cout << answer;
}
