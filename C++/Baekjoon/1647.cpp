#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#include <set>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned int ui;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int N, M;
int parent[100001], height[100001];
vector<pair<int, pii>> roads;

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
    cin >> N >> M;
    for(int i = 1 ; i <= N ; i++) {
        parent[i] = i;
        height[i] = 1;
    }
    for(int i = 0 ; i < M ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        roads.push_back({c, {a, b}});
    }
    sort(roads.begin(), roads.end());
    ll answer = 0;
    int Nnodes = 0;
    for(auto it : roads) {
        if(Nnodes == N - 2) break;
        if(unite_parent(it.second.first, it.second.second)) continue;
        answer += it.first;
        Nnodes++;
        
    }
    cout << answer;
}
