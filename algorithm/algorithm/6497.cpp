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

int m, n;
int house[200000], height[200000];

int find_house(int start) {
    return house[start] == start ? start : house[start] = find_house(house[start]);
}

bool route_house(int a, int b) {
    a = find_house(a); b = find_house(b);
    if(a == b) return true;
    if(height[a] < height[b]) swap(a, b);
    house[b] = a;
    if(height[a] == height[b])
        height[a]++;
    return false;
}

int main() {
    fast_io
    while (1) {
        vector<pair<ll, pii>> route;
        cin >> m >> n;
        if(!m && !n) break;
        ll sum = 0;
        for(int i = 0 ; i < m ; i++) {
            house[i] = i;
            height[i] = 1;
        }
        for(int i = 0 ; i < n ; i++) {
            int x, y;
            ll z;
            cin >> x >> y >> z;
            route.push_back({z, {x, y}});
            sum += z;
        }
        sort(route.begin(), route.end());
        ll answer = 0;
        for(auto& it : route) {
            if(route_house(it.second.first, it.second.second)) continue;
            answer += it.first;
        }
        cout << sum - answer << '\n';
    }
}
