#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int W, H, G, E;
vector<pii> graph[30*30];
vector<int> dist(30*30);
vector<int> visited(30 * 30, 0);
bool isCycle = false;

void init_graph() {
    int i, t;
    for(i = 0 ; i < H * W ; i++)
        graph[i].erase(graph[i].begin(), graph[i].end());
    for(i = 0 ; i < H - 1 ; i++) {
        for (t = 0 ; t < W - 1 ; t++) {
            graph[W*i+t].push_back({W*i+t + 1, 1});
            graph[W*i+t].push_back({W*(i+1)+t, 1});
            graph[W*i+t + 1].push_back({W*i+t, 1});
            graph[W*(i+1)+t].push_back({W*i+t, 1});
//            cout << "x: " << t << ", y: " << i << " index: " <<  W*i+t << ", to: " <<  W*i+t + 1 << " : dist -> " << 1 << ", to: "  << W*(i+1)+t << " : dist -> " << 1 << endl;
        }
        graph[W*i+t].push_back({W*(i+1)+t, 1});
        graph[W*(i+1)+t].push_back({W*i+t, 1});
//        cout << "x: " << t << ", y: " << i << " index: " <<  W*i+t << ", to: "  << W*(i+1)+t << " : dist -> " << 1 << endl;
    }
    for(t = 0 ; t < W - 1 ; t++)  {
        graph[W*i+t].push_back({W*i+t + 1, 1});
        graph[W*i+t + 1].push_back({W*i+t, 1});
//        cout << "x: " << t << ", y: " << i << " index: " <<  W*i+t << ", to: "  << W*i+t + 1 << " : dist -> " << 1 << endl;
    }
    graph[W*H-1].erase(graph[W*H-1].begin(), graph[W*H-1].end());
}

void bfs(int start) {
    queue<int> q;
    visited.assign(H * W, 0);
    visited[start] = 1;
    q.push(start);
    while (!q.empty()) {
        int now_pos = q.front();
        q.pop();
        for (auto next : graph[now_pos]) {
            if(!visited[next.first]) {
                q.push(next.first);
                visited[next.first] = 1;
            }
        }
    }
//    for (int i = 0 ; i < H ; i++) {
//        for (int t = 0 ; t < W ; t++) {
//            cout << visited[i*W+t] << ' ';
//        }
//        cout << endl;
//    }
//    cout << endl;
}

void bellman_ford(int start) {
    dist[start] = 0;
    
    for(int i = 0 ; i <= H * W ; i++) {
        for (int now_pos = 0 ; now_pos < H * W; now_pos++) {
            if(dist[now_pos] == INT_MAX) continue;
            for(auto &next : graph[now_pos]) {
                int next_pos = next.first;
                int next_dist = next.second;
                if(dist[next_pos] > next_dist + dist[now_pos]) {
                    dist[next_pos] = next_dist + dist[now_pos];
                    if(i == H * W) {
                        isCycle = true;
                    }
                }
            }
        }
    }
//    for(int i = 0 ; i < H ; i++) {
//        for(int t = 0 ; t < W ; t++) {
//            cout << "index: " << i*W+t << ", dist: "<< dist[W*i + t] << ", ";
//        }
//        cout << '\n';
//    }
//    cout << '\n';
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    while (1) {
        cin >> W >> H;
        if(!W) return 0;
        dist.assign(W * H, INT_MAX);
        init_graph();
        isCycle = false;
        
        cin >> G;
        for(int i = 0 ; i < G ; i++) {
            int a, b;
            cin >> a >> b;
            graph[W*b+a].erase(graph[W*b+a].begin(), graph[W*b+a].end());
        }
        
        cin >> E;
        for(int i = 0 ; i < E ; i++) {
            int a, b, c, d, e;
            cin >> a >> b >> c >> d >> e;
            graph[W*b+a].erase(graph[W*b+a].begin(), graph[W*b+a].end());
            graph[W*b+a].push_back({W*d+c, e});
        }
        
        bfs(0);
//        for(int i = 0 ; i < H ; i++) {
//            for(int t = 0 ; t < W ; t++) {
//                cout << "index: " << i*W+t <<':';
//                for(auto temp : graph[i*W+t])
//                    cout << "to: " << temp.first << ", dist: "<< temp.second << ", ";
//                cout << endl;
//            }
//            cout << '\n';
//        }
//        cout << '\n';
        
        bellman_ford(0);
        
        if(isCycle) {
            cout << "Never" << '\n';
            continue;
        }
        
        if(!visited[H * W - 1]) {
            cout << "Impossible" << '\n';
            continue;
        }
        
        cout << dist[H*W - 1] << '\n';
        
    }
    return 0;
}
