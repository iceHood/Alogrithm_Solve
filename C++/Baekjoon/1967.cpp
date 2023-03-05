#include <iostream>
#include <vector>
using namespace std;

vector<pair<int, int>> node[10001];
int visited[10001];
int maxNode = 0, maxDist = 0;

void clear() {
    for (int i = 0; i < 10001; i++) {
        visited[i] = 0;
    }
}

void dfs(int start, int dist) {
    visited[start] = 1;
    if (maxDist < dist) {
        maxNode = start;
        maxDist = dist;
    }
    for (int i = 0 ; i < node[start].size() ; i++) {
        pair<int, int> temp = node[start][i];
        if (!visited[temp.first]) {
            dfs(temp.first, temp.second + dist);
        }
    }
}

int main() {
    int N;
    cin >> N;
    for (int i = 1 ; i < N; i++) {
        int a, b, c;
        scanf("%d %d %d", &a, &b, &c);
        node[a].push_back({b, c});
        node[b].push_back({a, c});
    }
    clear();
    dfs(1, 0);
    clear();
    dfs(maxNode, 0);
    cout << maxDist;
    return 0;
}
