#include <iostream>
#include <queue>

using namespace std;

int N, M;
char graph[101][101];
bool visit[101][101];
int countG[101][101];
int dx[] = { 1, 0, -1, 0 };
int dy[] = { 0, 1, 0, -1 };

void bfs_maze(int y, int x) {
    visit[y][x] = true;
    countG[y][x] = 1;
    queue<pair<int, int>> q;
    q.push(make_pair(y, x));
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i = 0 ; i < 4 ; i++) {
            int nextRow = row + dy[i];
            int nextCol = col + dx[i];
            if (nextRow >= 0 && nextRow < N && nextCol >= 0 && nextCol < M) {
                if (!visit[nextRow][nextCol] && graph[nextRow][nextCol] == '1') {
                    countG[nextRow][nextCol] = countG[row][col] + 1;
                    visit[nextRow][nextCol] = true;
                    q.push(make_pair(nextRow, nextCol));
                }
            }
        }
    }
}

int main() {
    scanf("%d %d", &N, &M);
    for (int i = 0 ; i < N ; i++) {
        scanf("%s", graph[i]);
    }
    bfs_maze(0, 0);
    cout << countG[N - 1][M - 1];
}

