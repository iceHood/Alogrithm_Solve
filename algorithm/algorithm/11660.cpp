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
int graph[1025][1025];


int main() {
    fast_io
    cin >> N >> M;
    
    for(int i = 1 ; i <= N ; i++) {
        for(int t = 1 ; t <= N ; t++) {
            cin >> graph[i][t];
            graph[i][t] += graph[i][t-1];
        }
    }
    
    for(int i = 0 ; i < M ; i++) {
        ll answer = 0;
        int x_1, x_2, y_1, y_2;
        cin >> y_1 >> x_1 >> y_2 >> x_2;
        for(int t = y_1 ; t <= y_2 ; t++) {
            answer += graph[t][x_2] - graph[t][x_1 - 1];
        }
        cout << answer << '\n';
    }
    
    return 0;
}
