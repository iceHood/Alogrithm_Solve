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

pii start_pos;
int dy[4] = {0, 0, 1, -1};
int dx[4] = {1, -1, 0, 0};
int n, m;
int graph[1000][1000];
bool visited[1000][1000];

void bfs() {
    queue<pii> q;
    q.push(start_pos);
    graph[start_pos.first][start_pos.second] = 0;
    visited[start_pos.first][start_pos.second] = true;
    while (!q.empty()) {
        pii now = q.front();
        q.pop();
        for (int i = 0; i < 4; i++) {
            int nextY = now.first + dy[i];
            int nextX = now.second + dx[i];
            if (nextY < 0 || nextY >= n || nextX < 0 || nextX >= m) { continue; }
            if (graph[nextY][nextX] == 0) { continue; }
            if (visited[nextY][nextX]) { continue; }
            graph[nextY][nextX] = graph[now.first][now.second] + 1;
            visited[nextY][nextX] = true;
            q.push({nextY, nextX});
        }
    }
}

int main() {
    fast_io
    cin >> n >> m;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cin >> graph[i][j];
            if (graph[i][j] == 2) {
                start_pos = {i, j};
            }
        }
    }
    
    bfs();
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (graph[i][j] != 0 && !visited[i][j]) {
                cout << -1 << " ";
            } else {
                cout << graph[i][j] << " ";
            }
        }
        cout << "\n";
    }
    
    return 0;
}
