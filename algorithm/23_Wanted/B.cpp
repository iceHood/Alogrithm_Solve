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

int graph[1000][1000];
int N, M;
int dy[4] = {0, 0, 1, -1};
int dx[4] = {1, -1, 0, 0};

void adjustPos(int& y, int& x) {
    if(y < 0) {
        y = N - 1;
    } else if(y == N) {
        y = 0;
    }
    if(x < 0) {
        x = M - 1;
    } else if(x == M) {
        x = 0;
    }
}

void bfs(pii start) {
    queue<pii> q;
    q.push(start);
    graph[start.first][start.second] = 2;
    while (!q.empty()) {
        int curY = q.front().first;
        int curX = q.front().second;
        q.pop();
        for(int i = 0 ; i < 4 ; i++) {
            int nextY = curY + dy[i];
            int nextX = curX + dx[i];
            adjustPos(nextY, nextX);
            if(!graph[nextY][nextX]) {
                q.push({nextY, nextX});
                graph[nextY][nextX] = 2;
            }
        }
    }
    
}

int main() {
    fast_io
    cin >> N >> M;
    
    for(int i = 0 ; i < N ;i++) {
        for(int t = 0 ;t < M ; t++) {
            cin >> graph[i][t];
        }
    }
    
    int answer = 0;
    
    for(int i = 0 ; i < N ;i++) {
        for(int t = 0 ;t < M ; t++) {
            if (!graph[i][t]) {
                bfs({i, t});
                answer++;
            }
        }
    }
    
    cout << answer;
    return 0;
}
