#include <iostream>
using namespace std;

int N, M;
int graph[1025][1025];
int x1, y1, x2, y2;

int sol() {
    int sum = 0;
    for (int i = x1; i <= x2; i++) {
        for (int t = y1; t <= y2; t++) {
            sum += graph[i][t];
        }
    }
    return sum;
}

int main() {
    cin >> N >> M;
    
    for (int i = 1 ; i <= N; i++) {
        for (int t = 1; t <= N; t++) {
            scanf("%d", &graph[i][t]);
        }
    }
    
    for (int i = 0 ; i < M; i++) {
        scanf("%d %d %d %d", &x1, &y1, &x2, &y2);
        cout << sol() << '\n';
    }
    return 0;
}
