#include <iostream>
#include <queue>
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

int N, M;
int graph[100][100]; // -1 -> inside, 0 -> outside, 1 -> cheeeezeee
int visited[100][100];
int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};
bool isAllDone = false;

inline bool check_valid_position(pii& pos) {
    return pos.first < N && pos.first >= 0 && pos.second < M && pos.second >= 0;
}

void update_outside() {
    memset(visited, 0, sizeof(visited));
    visited[0][0] = 1;
    queue<pii> q;
    q.push({0, 0});
    while (!q.empty()) {
        pii now_pos = q.front();
        q.pop();
        for(int i = 0 ; i < 4 ; i++) {
            pii next_pos = {now_pos.first + dy[i], now_pos.second + dx[i]};
            if(!check_valid_position(next_pos) || graph[next_pos.first][next_pos.second] != 0) continue;
            if(!visited[next_pos.first][next_pos.second]) {
                q.push(next_pos);
                visited[next_pos.first][next_pos.second] = 1;
            }
        }
    }
}

void melting_cheeze() {
    isAllDone = true;
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < M ; t++) {
            if (graph[i][t] == 1) {
                isAllDone = false;
                int count = 0;
                for(int j = 0 ; j < 4 ; j++) {
                    if(visited[i+dy[j]][t+dx[j]]) count++;
                }
                if(count >= 2) graph[i][t] = 0;
            }
        }
    }
}

int main() {
    cin >> N >> M;
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < M ; t++) {
            cin >> graph[i][t];
        }
    }
    int count = 0;
    while(1) {
        update_outside();
        melting_cheeze();
        if(isAllDone) break;
        count++;
    }
    cout << count;
}
