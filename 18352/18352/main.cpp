#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int N, M, K, X;
vector<int> way[300001];
int visited[300001];
int dist[300001];

void bfs(int start) {
    queue<int> q;
    q.push(start);
    visited[start] = 1;
    while (!q.empty()) {
        int now = q.front();
        q.pop();
        for(auto next : way[now]) {
            if(!visited[next]) {
                visited[next] = 1;
                dist[next] = dist[now] + 1;
                q.push(next);
            }
        }
    }
}

int main() {
    
    cin >> N >> M >> K >> X;
    
    for(int i = 0 ; i < M ; i++) {
        pair<int, int> temp;
        cin >> temp.first >> temp.second;
        way[temp.first].push_back(temp.second);
    }
    
    bfs(X);
    
    int isThere = 0;
    for(int i = 1 ; i <= N ; i++) {
        if(dist[i] == K) {
            cout << i << '\n';
            isThere = 1;
        }
    }
    
    if(!isThere) cout << -1;
    return 0;
}
