#include <iostream>
#include <vector>
using namespace std;

int n, m;
int max_map = 0;
int count_map = 0;
int cnt = 0;
int graph[500][500];
int visited[500][500];

int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};

void dfs(int start_y, int start_x) {
    visited[start_y][start_x] = 1;
    cnt++;
    for(int i = 0 ; i < 4 ; i++) {
        int next_y = start_y + dy[i];
        int next_x = start_x + dx[i];
        if (next_y < 0 || next_x < 0 || next_y >= n || next_x >= m) continue;
        if (visited[next_y][next_x] || !graph[next_y][next_x]) continue;
        dfs(next_y, next_x);
    }
    return;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    cin >> n >> m;
    
    for(int i = 0 ; i < n ; i++) {
        for(int t = 0 ; t < m ; t++) {
            cin >> graph[i][t];
        }
    }
    
    for(int i = 0 ; i < n ; i++) {
        for(int t = 0 ; t < m ; t++) {
            if(visited[i][t] || !graph[i][t]) continue;
            cnt = 0;
            dfs(i, t);
            max_map = max_map < cnt ? cnt : max_map;
            count_map++;
        }
    }
    cout << count_map << '\n' << max_map;
    return 0;
}
