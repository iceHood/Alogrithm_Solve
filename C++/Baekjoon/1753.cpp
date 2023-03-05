#include <iostream>
#include <vector>
#include <queue>
using namespace std;
int INF = 987654321;

vector<pair<int, int>> node[20001];
priority_queue<pair<int, int>> q;
int dist[20001];
int V, E, K;

void dijkstra(int start) {
    q.push({0, start});
    dist[start] = 0;
    while (!q.empty()) {
        int nowNode = q.top().second;
        int nowDist = -q.top().first;
        q.pop();
        for (int i = 0 ; i < node[nowNode].size() ; i++) {
            int nextNode = node[nowNode][i].first;
            int nextDist = node[nowNode][i].second;
            if (nowDist + nextDist < dist[nextNode]) {
                dist[nextNode] = nowDist + nextDist;
                q.push({-dist[nextNode], nextNode});
            }
        }
    }
}

void clear() {
    for (int i = 0 ; i < 20001 ; i++) {
        dist[i] = INF;
    }
}

int main() {
    cin >> V >> E;
    cin >> K;
    
    for (int i = 0 ; i < E ; i++) {
        int u, v, w;
        scanf("%d %d %d", &u, &v, &w);
        node[u].push_back({v, w});
    }
    clear();
    dijkstra(K);
    for (int i = 1 ; i <= V ; i++) {
        if (dist[i] == INF) {
            cout << "INF" << '\n';
        } else cout << dist[i] << '\n';
    }
    return 0;
}
