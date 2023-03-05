#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int n, m, r;
int dist[101][101];
int items[101];

int main() {
    cin >> n >> m >> r;
    for(int i = 1 ; i <= n ; i++) {
        cin >> items[i];
    }
    for(int i = 1 ; i <= n ; i++ ) {
        for(int t = 1 ; t <= n ; t++) {
            dist[i][t] = INT_MAX;
            if(i == t) dist[i][t] = 0;
        }
    }
    for(int i = 0 ; i < r; i++) {
        int a, b, l;
        cin >> a >> b >> l;
        dist[a][b] = l;
        dist[b][a] = l;
    }
    for(int k = 1 ; k <= n; k++) {
        for(int i = 1 ; i <= n ; i++) {
            for (int t = 1 ; t <= n ; t++) {
                if(dist[i][k] != INT_MAX && dist[k][t] != INT_MAX)
                    dist[i][t] = min(dist[i][t], dist[i][k] + dist[k][t]);
            }
        }
    }
    
    int answers[101];
    int answer = INT_MIN;
    for(int i = 1 ; i <= n ; i++) {
        answers[i] = 0;
        for (int t = 1; t <= n ;t++) {
            if(dist[i][t] <= m)
                answers[i] += items[t];
        }
        if(answers[i] > answer) answer = answers[i];
    }
    cout << answer;
}
