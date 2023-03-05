#include <iostream>
using namespace std;

int graph[500][500] = { 0, };
bool visited[500][500] = { false, };
int answer = 0;
int dx[] = {0, 0, -1, 1};
int dy[] = {-1, 1, 0, 0};
int N, M;

void sol(int y, int x, int cnt, int sum) {
    if (x < 0 || x >= M || y < 0 || y >= N) {
        return;
    }
    visited[y][x] = true;
    if (!cnt) {
        visited[y][x] = false;
        if (answer < sum + graph[y][x]) {
            answer = sum + graph[y][x];
            return;
        } else return;
    }
    for (int i = 0 ; i < 4 ; i++) {
        if (visited[y + dy[i]][x + dx[i]]) {
            continue;
        }
        sol(y + dy[i], x + dx[i], cnt - 1, sum + graph[y][x]);
    }
    visited[y][x] = false;
    return;
}

void shape1(int y, int x) {
    int s;
    s = graph[y][x] + graph[y][x + 1] + graph[y][x + 2] + graph[y + 1][x + 1];
    if (answer < s) {
        answer = s;
        return;
    } else return;
}

void shape2(int y, int x) {
    int s;
    s = graph[y][x] + graph[y][x + 1] + graph[y][x + 2] + graph[y - 1][x + 1];
    if (answer < s) {
        answer = s;
        return;
    } else return;
}

void shape3(int y, int x) {
    int s;
    s = graph[y][x] + graph[y + 1][x] + graph[y + 2][x] + graph[y + 1][x + 1];
    if (answer < s) {
        answer = s;
        return;
    } else return;
}

void shape4(int y, int x) {
    int s;
    s = graph[y][x] + graph[y + 1][x] + graph[y + 2][x] + graph[y + 1][x - 1];
    if (answer < s) {
        answer = s;
        return;
    } else return;
}


int main() {

    cin >> N >> M;
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < M ; t++) {
            scanf("%d", &graph[i][t]);
        }
    }
    
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < M ; t++) {
            sol(i, t, 3, 0);
            if (i + 1 < N && t + 2 < M) shape1(i, t);
            if (i - 1 >= 0 && t + 2 < M) shape2(i, t);
            if (i + 2 < N && t + 1 < M) shape3(i, t);
            if (i + 2 < N && t - 1 >= 0) shape4(i, t);
        }
    }
    
    cout << answer;
    
    return 0;
}
