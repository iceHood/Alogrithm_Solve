#include <iostream>
#include <queue>
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

int N, M;
vector<pii> buses[1001];
vector<ll> dist(1001, INT_MAX);

void dijkstra(int start) {
    dist[start] = 0;
    priority_queue<pii, vector<pii>, greater<>> pq;
    pq.push({0, start});
    while (!pq.empty()) {
        int now_dist = pq.top().first;
        int now_pos = pq.top().second;
        pq.pop();
        
        if(dist[now_pos] < now_dist) continue;
        
        for(auto it : buses[now_pos]) {
            int next_dist = it.first;
            int next_pos = it.second;
            if(next_dist + now_dist < dist[next_pos]) {
                dist[next_pos] = next_dist + now_dist;
                pq.push({dist[next_pos], next_pos});
            }
        }
    }
}

int main() {
    cin >> N >> M;
    for(int i = 0 ; i < M ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        buses[a].push_back({c, b});
    }
    int start, end;
    cin >> start >> end;
    dijkstra(start);
    cout << dist[end];
    return 0;
}
