#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

vector<pair<int, int>> v[1001];
priority_queue<pair<int, int>> q;
int dist[1001] = { 0, };
int res[1001];
int N, M, X;

void bfs(int start) {
    q.push({0, start});
    dist[start] = 0;
    while (!q.empty()) {
        int current = q.top().second;
        int distance = -q.top().first;
        q.pop();
        
        for (int i = 0 ; i < v[current].size() ; i++) {
            int next = v[current][i].first;
            int nextDistance = v[current][i].second;
            if (nextDistance + distance < dist[next]) {
                dist[next] = nextDistance + distance;
                q.push({-dist[next], next});
            }
        }
    }
}
void cl() {
    for (int i = 0 ; i < 1001 ; i++) {
        dist[i] = 999999;
    }
}
int main() {
    cin >> N >> M >> X;
    
    for (int i = 0 ; i < M ; i++) {
        int a, b, c;
        scanf("%d %d %d", &a, &b, &c);
        v[a].push_back({b, c});
    }
    
    for (int i = 1 ; i <= N; i++) {
        cl();
        bfs(i);
        res[i] = dist[X];
    }
    cl();
    bfs(X);
    for (int i = 1 ; i <= N ; i++) {
        res[i] += dist[i];
    }
    sort(res + 1, res + N + 1);
    cout << res[N];
    return 0;
}
