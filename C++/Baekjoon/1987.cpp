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

int R, C;
string graph[20];
bool visited[26];
int dx[] = {0, 0, 1, -1};
int dy[] = {1, -1, 0, 0};
int max_count = 0;

void back_track(int y, int x, int count) {
    max_count = max(max_count, count);
    visited[graph[y][x] - 'A'] = true;
    for (int i = 0 ; i < 4 ; i++) {
        int next_y = y + dy[i];
        int next_x = x + dx[i];
        if (next_y < 0 || next_y >= R || next_x < 0 || next_x >= C) continue;
        if (visited[graph[next_y][next_x] - 'A']) continue;
        back_track(next_y, next_x, count + 1);
    }
    visited[graph[y][x] - 'A'] = false;
}

int main() {
    cin >> R >> C;
    for (int i = 0 ; i < R ; i++) {
        cin >> graph[i];
    }
    back_track(0, 0, 1);
    cout << max_count;
}
