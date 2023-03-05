#include <iostream>
#include <queue>

using namespace std;

int M, N;
int graph[1000][1000];
int dist[1000][1000];
int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};
int answer = 0;
queue<pair<int, int>> q;

int main() {
    scanf("%d %d", &M, &N);
    for (int i = 0 ; i < N; i++) {
        for (int t = 0 ; t < M ; t++) {
            scanf("%d", &graph[i][t]);
            if (graph[i][t] == 1) {
                q.push({i, t});
            }
            if (graph[i][t] == 0) {
                dist[i][t] = -1;
            }
        }
    }
    while (!q.empty()) {
        pair<int, int> cen = q.front();
        q.pop();
        for (int i = 0 ; i < 4 ; i++) {
            int nextX = cen.first + dx[i];
            int nextY = cen.second + dy[i];
            if (nextX < 0 || nextX >= N || nextY < 0 || nextY >= M) continue;
            if (dist[nextX][nextY] >= 0 || graph[nextX][nextY] == -1) continue;
            dist[nextX][nextY] = dist[cen.first][cen.second] + 1;
            q.push({nextX, nextY});
        }
    }
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < M ; t++) {
            if (dist[i][t] == -1) {
                cout << -1;
                return 0;
            }
            answer = max(answer, dist[i][t]);
        }
    }
    cout << answer;
}
