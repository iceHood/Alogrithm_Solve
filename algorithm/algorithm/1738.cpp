#include <iostream>
#include <queue>
#include <vector>
#include <climits>
using namespace std;

typedef long long ll;
#define golmok_max 20001
#define spot_max 101

int n, m;
bool isPositiveExist = false;
vector<pair<int, int>> golmok[golmok_max];
vector<ll> dist;
vector<int> map_for_bfs[spot_max];
vector<int> visited;

void bfs(int start) {
    queue<int> q;
    q.push(start);
    visited[start] = 1;
    while (!q.empty()) {
        int now_pos = q.front();
        q.pop();
        for(auto temp : map_for_bfs[now_pos]) {
            if(!visited[temp]) {
                visited[temp] = 1;
                q.push(temp);
            }
        }
    }
}


void bellman_ford(int start) {
    dist[start] = 0;
    for(int i = 1 ; i <= n ; i++) {
        for(int now_pos = 1 ; now_pos <= n ; now_pos++) {
            if (dist[now_pos] == INT_MIN) continue;
            for (auto temp : golmok[now_pos]) {
                int next_pos = temp.first;
                int next_dist = temp.second;
//                cout << "now_pos: " << now_pos << ", next_pos: " << next_pos << ", next_dist: " << next_dist << '\n';
                if(dist[next_pos] < dist[now_pos] + next_dist) {
//                    cout << "Before-dist[next_pos]: " << dist[next_pos] << " => Before-dist[next_pos]: " << dist[now_pos] + next_dist << '\n';
                    dist[next_pos] = dist[now_pos] + next_dist;
                    visited[next_pos] = now_pos;
                    if (i == n) {
                        isPositiveExist = true;
                    }
                }
            }
        }
    }
}

int main() {
    cin >> n >> m;
    for(int i = 0 ; i < m ; i++) {
        int u, v, w;
        cin >> u >> v >> w;
        golmok[u].push_back({v, w});
        map_for_bfs[u].push_back(v);
    }
    dist.assign(n + 1, INT_MIN);
    visited.assign(n + 1, 0);
    
    bfs(1);
    if (!visited[n]) {
        cout << -1;
        return 0;
    }
    for(int i = 2 ; i < n ; i++) {
        visited.assign(n + 1, 0);
        bfs(i);
        if (visited[n]) continue;
        golmok[i].erase(golmok[i].begin(), golmok[i].end());
    }
    bellman_ford(1);
    
    if(isPositiveExist) cout << -1;
    else {
        vector<int> answer;
        int idx = n;
        while (1) {
            answer.push_back(idx);
            if(idx == 1) break;
            else idx = visited[idx];
        }
        for(int t = answer.size() - 1 ; t >= 0 ; t--) {
            cout << answer[t] << ' ';
        }
    }

    
    return 0;
}
