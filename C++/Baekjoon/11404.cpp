#include <iostream>
#include <algorithm>
#define INF 123456789
using namespace std;

int node[100][100];
int N, M;

void sol() {
    for (int k = 0; k < N; k++) {
        for (int i = 0; i < N; i++) {
            for (int t = 0; t < N; t++) {
                node[i][t] = min(node[i][t], node[i][k] + node[k][t]);
            }
        }
    }
}

int main() {
    cin >> N >> M;
    for (int i = 0; i < N ; i++) {
        for (int t = 0 ; t < N ; t++) {
            node[i][t] = i == t ? 0 : INF;
        }
    }
    for (int i = 0; i < M; i++) {
        int a, b, c;
        scanf("%d %d %d", &a, &b, &c);
        a--;
        b--;
        node[a][b] = min(node[a][b], c);
    }
    
    sol();
    
    for (int i = 0; i < N; i++) {
        for (int t = 0 ; t < N; t++) {
            node[i][t] == INF ? cout << "0 " : cout << node[i][t] << ' ';
        }
        cout << '\n';
    }
    
    return 0;
}
