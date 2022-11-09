#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

priority_queue<int> a;
vector<pair<int, int>> nodes[10000];
vector<int> dist(10000, 123456789);

void dijkstra(int start) {
    dist[start] = 0;
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<>> pq;
    pq.push({0, start});
    
    while (!pq.empty()) {
        int now_dist = pq.top().first;
        int now_pos = pq.top().second;
        pq.pop();
        
        if(dist[now_pos] < now_dist) continue;
        
        for (auto &temp : nodes[now_pos]) {
            int next_dist = temp.first;
            int next_pos = temp.second;
            if(dist[next_pos] > next_dist + now_dist) {
                dist[next_pos] = next_dist + now_dist;
                pq.push({dist[next_pos], next_pos});
            }
        }
    }
}
int main() {
    int N, D;
    cin >> N >> D;
    for(int i = 0 ; i < D ; i++) {
        nodes[i].push_back({1, i+1});
    }
    for (int i = 0 ; i < N ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        if(b - a <= c || b > D) continue;
        nodes[a].push_back({c, b});
    }
    dijkstra(0);
    
    cout << dist[D];
    
    
    return 0;
}
