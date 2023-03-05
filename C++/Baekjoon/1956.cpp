#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int V, E;
ll dist[401][401];

int main() {
    cin >> V >> E;
    for(int i = 0 ; i <= V ; i++) {
        for(int t = 0 ; t <= V ; t++) {
            dist[i][t] = INT_MAX;
            if(i == t) dist[i][t] = 0;
        }
    }
    for(int i = 0 ; i < E ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        dist[a][b] = c;
    }
    
    for(int k = 1 ; k <= V ; k++) {
        for(int i = 1 ; i <= V ; i++) {
            for (int t = 1 ; t <= V ; t++) {
                if(dist[i][k] != INT_MAX && dist[k][t] != INT_MAX)
                    dist[i][t] = min(dist[i][t], dist[i][k]+dist[k][t]);
            }
        }
    }
    
    ll answer = INT_MAX;
    for(int i = 1 ; i <= V ; i++) {
        for(int t = 1 ; t <= V ; t++) {
            if(i == t) continue;
            answer = min(answer, dist[i][t] + dist[t][i]);
        }
    }
    if( answer == INT_MAX) cout << -1;
    else cout << answer;
}
