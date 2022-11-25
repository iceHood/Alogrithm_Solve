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

int building[100001], height[100001], N, M;
vector<pair<ll, pii>> roads;

int find_building(int start) {
    return building[start] == start ? start : building[start] = find_building(building[start]);
}

bool unite_building(int a, int b) {
    a = find_building(a); b = find_building(b);
    if(a == b) return true;
    if(height[a] < height[b]) swap(a, b);
    building[b] = a;
    if(height[a] == height[b])
        height[a]++;
    return false;
}

int main() {
    cin >> N >> M;
    ll all_cost = 0;
    ll cost = 0;
    for(int i = 1 ; i <= N ; i++) {
        building[i] = i;
        height[i] = 1;
    }
    for(int i = 0 ; i < M ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        roads.push_back({c, {a, b}});
        all_cost += c;
    }
    sort(roads.begin(), roads.end());
    for(auto it : roads) {
        if(unite_building(it.second.first, it.second.second)) continue;
        cost += it.first;
    }
    
    int gijun = find_building(1);
    for(int i = 1 ; i <= N ; i++) {
        if(gijun != find_building(i)) {
            cout << -1;
            return 0;
        }
    }
    cout << all_cost - cost;
    return 0;
}
