#include <iostream>
#include <string>
#include <queue>
using namespace std;

string graph[1000];
int dist[1000][1000][2];
int dy[4] = {0, 0, 1, -1};
int dx[4] = {1, -1, 0, 0};
int N, M;
queue<pair<pair<int, int>, int>> q; // y, x, 1지났는지

void clear() {
    for (int i = 0 ; i < 1000; i++) {
        for (int t = 0 ; t < 1000 ; t++) {
            dist[i][t][0] = 0;
            dist[i][t][1] = 0;
        }
    }
}

int bfs(int y, int x) {
    dist[y][x][1] = 1;
    q.push({{y, x}, 1});
    while (!q.empty()) {
        int currentY = q.front().first.first;
        int currentX = q.front().first.second;
        int currentIsPassedOne = q.front().second;
        q.pop();
        if (currentY == N - 1 && currentX == M - 1) {
            return dist[currentY][currentX][currentIsPassedOne];
        }
        for (int i = 0; i < 4 ; i++) {
            int nextY = currentY + dy[i];
            int nextX = currentX + dx[i];
            
            if (nextY < 0 || nextX < 0 || nextY >= N || nextX >= M ) continue;
            
            if (graph[nextY][nextX] == '1' && currentIsPassedOne) {
                dist[nextY][nextX][currentIsPassedOne - 1] = dist[currentY][currentX][currentIsPassedOne] + 1;
                q.push({{nextY, nextX}, currentIsPassedOne - 1});
            }
            if (graph[nextY][nextX] == '0' && dist[nextY][nextX][currentIsPassedOne] == 0) {
                dist[nextY][nextX][currentIsPassedOne] = dist[currentY][currentX][currentIsPassedOne] + 1;
                q.push({{nextY, nextX}, currentIsPassedOne});
            }
        }
    }
    return -1;
}

int main() {
    cin >> N >> M;
    for (int i = 0; i < N; i++) {
        cin >> graph[i];
    }
    clear();
    cout << bfs(0, 0);
    
    return 0;
}
