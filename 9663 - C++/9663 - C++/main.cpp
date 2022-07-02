#include <iostream>
using namespace std;

int N;
int graph[15];
int result;

bool find(int pos) {
    for (int i = 0; i < pos; i++) {
        if (graph[i] == graph[pos] || pos - i == abs(graph[pos] - graph[i]) ) {
            return false;
        }
    }
    return true;
}

void sol(int pos) {
    if (pos == N) {
        result++;
        return;
    }
    for (int i = 0; i < N; i++) {
        graph[pos] = i;
        if (find(pos)) {
            sol(pos + 1);
        }
    }
}

int main() {
    cin >> N;
    sol(0);
    cout << result;
    return 0;
}
