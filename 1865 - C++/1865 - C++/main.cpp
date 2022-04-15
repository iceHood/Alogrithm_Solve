#include <iostream>
#include <vector>
using namespace std;
int INF = 987654321;

vector<pair<pair<int, int>, int>> node;
int dist[501];
int TC;
int N, M, W;
int S, E, T;

void clear() {
    for (int i = 0 ; i < 501 ; i++) {
        dist[i] = INF;
    }
    node.clear();
}

bool bellmanFord(int start) {
    dist[start] = 0;
    for (int i = 1 ; i <= N - 1 ; i++) {
        for (int j = 0 ; j < node.size() ; j++) {
            int begin = node[j].first.first;
            int end = node[j].first.second;
            int time = node[j].second;
            if (dist[begin] == INF) {
                continue;
            }
            if (dist[end] > dist[begin] + time) {
                dist[end] = dist[begin] + time;
            }
        }
    }
    for (int i = 0 ; i < node.size() ; i++) {
        int begin = node[i].first.first;
        int end = node[i].first.second;
        int time = node[i].second;
        if (dist[begin] == INF) {
            continue;
        }
        if (dist[end] > dist[begin] + time) {
            return true;
        }
    }
    return false;
}

int main() {
    
    cin >> TC;
    
    while (TC--) {
        //입력
        clear();
        scanf("%d %d %d", &N, &M, &W);
        for (int i = 0 ; i < M ; i++) {
            scanf("%d %d %d", &S, &E, &T);
            node.push_back({{S, E}, T});
            node.push_back({{E, S}, T});
        }
        for (int i = 0 ; i < W ; i++) {
            scanf("%d %d %d", &S, &E, &T);
            node.push_back({{S, E}, -T});
        }
        
        if (bellmanFord(1)) {
            cout << "YES" << '\n';
        } else {
            cout << "NO" << '\n';
        }
    }
    return 0;
}
