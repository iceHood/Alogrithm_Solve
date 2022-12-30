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

int n, m;
vector<pii> buses[1001];
vector<int> route[1001];
int dist[1001];

void bellman_ford(int start) {
    dist[start] = 0;
    route[start].push_back(start);
    for(int i = 1 ; i <= n ; i++) {
        for(int now_pos = 1 ; now_pos <= n ; now_pos++) {
            if(dist[now_pos] == INT_MAX) continue;
            for(auto& it : buses[now_pos]) {
                int& next_pos = it.first;
                int& next_dist = it.second;
                if(dist[next_pos] > dist[now_pos] + next_dist) {
                    dist[next_pos] = dist[now_pos] + next_dist;
                    route[next_pos].erase(route[next_pos].begin(), route[next_pos].end());
                    route[next_pos] = route[now_pos];
                    route[next_pos].push_back(next_pos);
                }
            }
        }
    }
}

int main() {
    cin >> n >> m;
    for(int i = 0 ; i <= n ; i++) {
        dist[i] = INT_MAX;
    }
    for(int i = 0 ; i < m ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        buses[a].push_back({b, c});
    }
    int start, dest;
    cin >> start >> dest;
    bellman_ford(start);
    cout << dist[dest] << '\n';
    cout << route[dest].size() << '\n';
    for(int& it : route[dest]) cout << it << ' ';
}
