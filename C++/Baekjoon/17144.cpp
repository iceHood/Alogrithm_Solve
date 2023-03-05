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

int R, C, T;
int graph[50][50];
vector<pii> chung_jung_gi_pos;
int elapsed_time = 0;

inline bool check_valid_pos(int& y, int& x) {
    return y < R && y >= 0 && x < C && x >=0 && graph[y][x] != -1;
}

void spread_dust() {
    static int dy[4] = {1, -1, 0, 0};
    static int dx[4] = {0, 0, 1, -1};
    int temp_graph[50][50];
    memset(temp_graph, 0, sizeof(temp_graph));
    for(int now_y = 0 ; now_y < R ; now_y++) {
        for(int now_x = 0 ; now_x < C ; now_x++) {
            int count_of_minus = 0;
            for(int j = 0 ; j < 4 ; j++) {
                int next_y = now_y + dy[j];
                int next_x = now_x + dx[j];
                if(check_valid_pos(next_y, next_x)) {
                    temp_graph[next_y][next_x] += graph[now_y][now_x] / 5;
                    count_of_minus++;
                }
            }
            temp_graph[now_y][now_x] += graph[now_y][now_x] - graph[now_y][now_x] / 5 * count_of_minus;
        }
    }
    for(int i = 0 ; i < R ; i++) {
        for(int t = 0 ; t < C ; t++) {
            graph[i][t] = temp_graph[i][t];
        }
    }
}

void circulate_air() {
    //upCycle
    int now_y = chung_jung_gi_pos[0].first;
    int now_x = chung_jung_gi_pos[0].second + 1;
    int prev_value = graph[now_y][now_x];
    graph[now_y][now_x] = 0;
    for(int next_x = now_x + 1 ; next_x < C ; next_x++) {
        int temp = graph[now_y][next_x];
        graph[now_y][next_x] = prev_value;
        prev_value = temp;
    }
    now_x = C - 1;
    for(int next_y = now_y - 1 ; next_y >= 0 ; next_y--) {
        int temp = graph[next_y][now_x];
        graph[next_y][now_x] = prev_value;
        prev_value = temp;
    }
    now_y = 0;
    for(int next_x = now_x - 1 ; next_x >= 0 ; next_x--) {
        int temp = graph[now_y][next_x];
        graph[now_y][next_x] = prev_value;
        prev_value = temp;
    }
    now_x = 0;
    for(int next_y = now_y + 1 ; next_y < chung_jung_gi_pos[0].first ; next_y++) {
        int temp = graph[next_y][now_x];
        graph[next_y][now_x] = prev_value;
        prev_value = temp;
    }
    // DownCycle
    now_y = chung_jung_gi_pos[1].first;
    now_x = chung_jung_gi_pos[1].second + 1;
    prev_value = graph[now_y][now_x];
    graph[now_y][now_x] = 0;
    for(int next_x = now_x + 1 ; next_x < C ; next_x++) {
        int temp = graph[now_y][next_x];
        graph[now_y][next_x] = prev_value;
        prev_value = temp;
    }
    now_x = C - 1;
    for(int next_y = now_y + 1 ; next_y < R ; next_y++) {
        int temp = graph[next_y][now_x];
        graph[next_y][now_x] = prev_value;
        prev_value = temp;
    }
    now_y = R - 1;
    for(int next_x = now_x - 1 ; next_x >= 0 ; next_x--) {
        int temp = graph[now_y][next_x];
        graph[now_y][next_x] = prev_value;
        prev_value = temp;
    }
    now_x = 0;
    for(int next_y = now_y - 1 ; next_y > chung_jung_gi_pos[1].first ; next_y--) {
        int temp = graph[next_y][now_x];
        graph[next_y][now_x] = prev_value;
        prev_value = temp;
    }
}

void update_graph() {
    spread_dust();
    circulate_air();
    elapsed_time++;
}

int main() {
    fast_io
    cin >> R >> C >> T;
    for(int i = 0 ; i < R ; i++) {
        for(int t = 0 ; t < C ; t++) {
            cin >> graph[i][t];
            if(graph[i][t] == -1) chung_jung_gi_pos.push_back({i, t});
        }
    }
    while (elapsed_time < T) update_graph();
    
    int result = 0;
    for(int i = 0 ; i < R ; i++) {
        for(int t = 0 ; t < C ; t++) {
            result += graph[i][t];
        }
    }
    result += 2;
    cout << result;
}
