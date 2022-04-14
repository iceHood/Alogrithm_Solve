#include <iostream>
#include <vector>
#include <queue>
using namespace std;
const int INF = 987654321;

vector<pair<int, int>> node[801];
priority_queue<pair<int, int>> q;
int dist[801];
int N, E, v1, v2;

void dicstra(int start) {
    q.push({0, start});
    dist[start] = 0;
    while (!q.empty()) {
        int nowDist = -q.top().first;
        int nowNode = q.top().second;
        q.pop();
        for (int i = 0 ; i < node[nowNode].size() ; i++) {
            int nextNode = node[nowNode][i].first;
            int nextDist = node[nowNode][i].second;
            if (nextDist + nowDist < dist[nextNode]) {
                dist[nextNode] = nowDist + nextDist;
                q.push({-dist[nextNode], nextNode});
            }
        }
    }
}

void clear() {
    for (int i = 0 ; i < 801; i++) {
        dist[i] = INF;
    }
}

int main() {
    cin >> N >> E;
    for (int i = 0 ; i < E ; i++) {
        int a, b, c;
        scanf("%d %d %d", &a, &b, &c);
        node[a].push_back({b, c});
        node[b].push_back({a, c});
    }
    cin >> v1 >> v2;
    
    int res1 = 0, res2 = 0, sv1, sv2, v1v2, v1N, v2N;
    clear();
    dicstra(1);
    sv1 = dist[v1];
    sv2 = dist[v2];
    
    clear();
    dicstra(v1);
    v1v2 = dist[v2];
    v1N = dist[N];
    
    clear();
    dicstra(v2);
    v2N = dist[N];
    
    res1 = sv1 + v1v2 + v2N;
    res2 = sv2 + v1v2 + v1N;
    
    if (res1 > res2) {
        res1 = res2;
    }
    
    if (res1 >= INF || v1v2 == INF || res1 < 0) {
        cout << -1;
    } else cout << res1;
    return 0;
}
