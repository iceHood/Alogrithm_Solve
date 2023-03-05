#include <iostream>
#include <vector>
#include <queue>
using namespace std;

vector<vector<int>> graph(1001);
bool visited[1001] = { false, };

void bfs(int x) {
    queue<int> q;
    q.push(x);
    visited[x] = true;
    while (!q.empty()) {
        int temp = q.front();
        q.pop();
        int size = graph[temp].size();
        for (int i = 0 ; i < size ; i++) {
            int temp2 = graph[temp][i];
            if (!visited[temp2]) {
                q.push(temp2);
                visited[temp2] = true;
            }
            
        }
    }
    
}

int main() {
    int n, m, count = 0;
    cin >> n >> m;
    for (int i = 0 ; i < m ; i++) {
        int x, y;
        scanf("%d %d", &x, &y);
        graph[x-1].push_back(y-1);
        graph[y-1].push_back(x-1);
    }
    for (int i = 0 ; i < n ; i++) {
        if (!visited[i]) {
            bfs(i);
            count++;
        }
    }
    cout << count;
    return 0;
}
