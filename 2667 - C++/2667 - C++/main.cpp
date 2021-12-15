#include <iostream>
#include <queue>
#include <vector>

using namespace std;

int N;
string graph[25];
bool visit[25][25] = {false,};
priority_queue<int, vector<int>, greater<int>> q;
int solution(int y, int x) {
    if (y < 0 || y >= N || x < 0 || x >= N ) {
        return 0;
    }
    if (!visit[y][x] && graph[y][x] == '1') {
        visit[y][x] = true;
        int a = solution(y + 1, x);
        int b = solution(y - 1, x);
        int c = solution(y, x + 1);
        int d = solution(y, x - 1);
        return a + b + c + d + 1;
    }
    return 0;
}

int main() {
    scanf("%d", &N);
    for (int i = 0 ; i < N ; i++) {
        string temp;
        cin >> temp;
        graph[i] = temp;
    }
    for (int i = 0 ; i < N ; i++) {
        for (int t = 0 ; t < N ; t++) {
            if (int rlt = solution(i, t)) {
                q.push(rlt);
            }
        }
    }
    cout << q.size() << "\n";
    while (!q.empty()) {
        cout << q.top() << "\n";
        q.pop();
    }
}
