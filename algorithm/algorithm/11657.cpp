#include <iostream>
#include <queue>
#include <vector>
#include <climits>
typedef long long ll;
using namespace std;

int N, M;
vector<pair<int, int>> bus[6001];
vector<ll> dist;
bool isNegativeExist = false;
void belman_ford(int start) {
    dist[start] = 0;
    
    for(int i = 1 ; i <= N ; i++) {
        for(int t = 1 ; t <= N ; t++) {
            if(dist[t] == INT_MAX) continue;
            for(auto &temp : bus[t]) {
                int next_pos = temp.first;
                int next_dist = temp.second;
                if(dist[next_pos] > dist[t] + next_dist) {
                    dist[next_pos] = dist[t] + next_dist;
                    if (i == N) {
                        isNegativeExist = true;
                    }
                }
            }
        }
    }
}

int main() {
    cin >> N >> M;
    
    for(int i = 0 ; i < M ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        bus[a].push_back({b, c});
    }
    
    dist.assign(N + 1, INT_MAX);
    
    belman_ford(1);
    
    if(isNegativeExist) cout << -1;
    else {
        for (int i = 2 ; i <= N ; i++) {
            if(dist[i] == INT_MAX) cout << -1 << '\n';
            else cout << dist[i] << '\n';
        }
    }
    
}
