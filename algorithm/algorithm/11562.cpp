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

int n, m;
int dist[251][251];

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    cin >> n >> m;
    for(int i = 1 ; i <= n ; i++) {
        for(int t = 1 ; t <= n ; t++) {
            dist[i][t] = INT_MAX;
            if(i == t) dist[i][t] = 0;
        }
    }
    
    for(int i = 0 ; i < m ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        if(c) {dist[a][b] = 0; dist[b][a] = 0;}
        else {dist[a][b] = 0; dist[b][a] = 1;}
    }
    
    for(int k = 1 ; k <= n ; k++) {
        for(int i = 1 ; i <= n ; i++) {
            for(int t= 1 ; t <= n ; t++) {
                if(dist[i][k] != INT_MAX && dist[k][t] != INT_MAX)
                    dist[i][t] = min(dist[i][t], dist[i][k] + dist[k][t]);
            }
        }
    }
    int k;
    cin >> k;
    while (k--) {
        int a, b;
        cin >> a >> b;
        cout << dist[a][b] << '\n';
    }
}
