#include <iostream>
#include <queue>
using namespace std;

// 상하좌우로 이동
// 크기가 자기크기 이하인 물고기가 있는 칸만 지나갈 수 있음
// 더 이상 못 먹을 때까지 진행
// 먹을 수 있는 물고기 1마리 - 먹으러 감
// 먹을 수 있는 물고기 2마리 이상 - 가장 가까운 물고기 먹으러 감
//                         - 1.가장 위에 있는 물고기, 2.가장 왼쪽에 있는 물고기
// 이동 하면 바로 먹음


int graph[20][20] = { 0 };
int N;

int dist[20][20] = { -1 };
int minDist = 500, minY = 500, minX = 500;

queue<pair<int, int>> q;

int sharkBig = 2;
int sharkX, sharkY;
int sharkMov = 0;
int sharkEat = 0;

int dx[] = { 0, -1, 0, 1 };
int dy[] = { -1, 0, 1, 0 };


void initB() {
    minDist = minY = minX = 500;
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < N ; t++) {
            dist[i][t] = -1;
        }
    }
}
//가장 가까운 물고기 찾기
void bfs(int startY, int startX) {
    
    q.push({startY, startX});
    dist[startY][startX] = 0;
    while (!q.empty()) {
        pair<int, int> temp = q.front();
        q.pop();
        int y = temp.first;
        int x = temp.second;
        for (int i = 0 ; i < 4; i++) {
            
            int nx = x + dx[i];
            int ny = y + dy[i];
            if (nx < 0 || nx >= N || ny < 0 || ny >= N) continue;
            if (graph[ny][nx] > sharkBig || dist[ny][nx] != -1) continue;
            dist[ny][nx] = dist[y][x] + 1;
            if (graph[ny][nx] < sharkBig && graph[ny][nx]) {
                if (minDist > dist[ny][nx]) {
                    minDist = dist[ny][nx];
                    minX = nx;
                    minY = ny;
                } else if (minDist == dist[ny][nx]) {
                    if (minY == ny) {
                        if (minX > nx) {
                            minX = nx;
                            minY = ny;
                        }
                    } else if (minY > ny) {
                        minX = nx;
                        minY = ny;
                    }
                }
            }
            q.push({ny, nx});
        }
    }
}


int main() {
    cin >> N;
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < N ; t++) {
            scanf("%d", &graph[i][t]);
            if (graph[i][t] == 9) {
                sharkX = t;
                sharkY = i;
                graph[i][t] = 0;
            }
        }
    }
    
    while (true) {
        initB();
        
        bfs(sharkY, sharkX);
        
        if (minY != 500 && minX != 500) {
            sharkMov += minDist;
            sharkEat++;
            if (sharkEat == sharkBig) {
                sharkBig++;
                sharkEat = 0;
            }
            sharkY = minY;
            sharkX = minX;
            graph[sharkY][sharkX] = 0;
            
        } else break;
    }
    
    cout << sharkMov;
    
    return 0;
}
