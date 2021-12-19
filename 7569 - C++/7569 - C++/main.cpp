#include <iostream>
#include <queue>

using namespace std;

int dist[100][100][100];
int graph[100][100][100];
int M, N, H;
int dx[6] = {1, 0, 0, -1, 0, 0};
int dy[6] = {0, 1, 0, 0, -1, 0};
int dz[6] = {0, 0, 1, 0, 0, -1};
queue<pair<int, pair<int, int>>> q;
int cnt = 0;

int main() {
    scanf("%d %d %d", &M, &N, &H);
    for (int i = 0 ; i < H ; i++) {
        for (int t = 0 ; t < N ; t++) {
            for (int p = 0; p < M; p++) {
                scanf("%d", &graph[i][t][p]);
                if (graph[i][t][p] == 1) {
                    q.push({i, {t, p}});
                }
                if (graph[i][t][p] == 0) {
                    dist[i][t][p] = -1;
                }
            }
        }
    }
    while (!q.empty()) {
        pair<int, pair<int, int>> cen = q.front();
        q.pop();
        for (int i = 0 ; i < 6; i++) {
            int nextX = cen.second.second + dx[i];
            int nextY = cen.second.first + dy[i];
            int nextZ = cen.first + dz[i];
            if (nextX < 0 || nextX >= M || nextY < 0 || nextY >= N || nextZ < 0 || nextZ >= H) continue;
            if (graph[nextZ][nextY][nextX] == -1 || dist[nextZ][nextY][nextX] >= 0) continue;
            dist[nextZ][nextY][nextX] = dist[cen.first][cen.second.first][cen.second.second] + 1;
            q.push({nextZ, {nextY, nextX}});
        }
    }
    for (int i = 0 ; i < H ; i++) {
        for (int t = 0 ; t < N ; t++) {
            for (int p = 0; p < M; p++) {
                if (dist[i][t][p] == -1) {
                    cout << -1;
                    return 0;
                }
                cnt = max(cnt, dist[i][t][p]);
            }
        }
    }
    cout << cnt;
}
