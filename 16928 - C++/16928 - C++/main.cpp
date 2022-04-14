#include <iostream>
#include <queue>
using namespace std;

int dist[101];
int ls[101];
int N, M;
queue<int> q;


void bfs(int start) {
    q.push(start);
    dist[start] = 0;
    while (!q.empty()) {
      
        int temp = q.front();
        q.pop();
        
        if (dist[100] != -1) break;
      
        for (int i = 1 ; i < 7 ; i++) {
            int ntemp = temp + i;
            if (ntemp > 100) continue;
            if (ls[ntemp]) ntemp = ls[ntemp];
            if (dist[ntemp] == -1) {
              q.push(ntemp);
              dist[ntemp] = dist[temp] + 1;
            }
        }
    }
}

int main() {
    
    for (int i = 0 ; i < 101 ; i++) {
        dist[i] = -1;
    }
    cin >> N >> M;
    
    for (int i = 0 ; i < N + M ; i++) {
        int a, b;
        cin >> a >> b;
        ls[a] = b;
        
    }
    
    bfs(1);
    cout << dist[100];
    return 0;
}
