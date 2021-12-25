#include <iostream>
#include <cstring>

using namespace std;

char graph[100][100];
char graphRG[100][100];
bool visited[100][100] = {false, };
bool visitedRG[100][100] = {false, };
int N, cnt, cntRG;

bool dfs(int y, int x, char gijun) {
    if (y < 0 || y >= N || x < 0 || x >= N) {
        return false;
    }
    if (!visited[y][x] && gijun == graph[y][x]) {
        visited[y][x] = true;
        dfs(y + 1, x, gijun);
        dfs(y - 1, x, gijun);
        dfs(y, x + 1, gijun);
        dfs(y, x - 1, gijun);
        return true;
    }
    return false;
}

bool dfsRG(int y, int x, char gijun) {
    if (y < 0 || y >= N || x < 0 || x >= N) {
        return false;
    }
    if (!visitedRG[y][x] && gijun == graphRG[y][x]) {
        visitedRG[y][x] = true;
        dfsRG(y + 1, x, gijun);
        dfsRG(y - 1, x, gijun);
        dfsRG(y, x + 1, gijun);
        dfsRG(y, x - 1, gijun);
        return true;
    }
    return false;
}

int main() {
    scanf("%d", &N);
    for (int i = 0 ; i < N ; i++) {
        scanf("%s", graph[i]);
        strcpy(graphRG[i], graph[i]);
        for (int t = 0 ; t < N ; t++) {
            if (graphRG[i][t] == 'R') {
                graphRG[i][t] = 'G';
            }
        }
    }
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < N ; t++) {
            if(dfs(i, t, graph[i][t])) {
                cnt++;
            }
            if (dfsRG(i, t, graphRG[i][t])) {
                cntRG++;
            }
        }
    }
    cout << cnt << " " << cntRG;
}
