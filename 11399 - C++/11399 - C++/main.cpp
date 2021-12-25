#include <iostream>
#include <queue>

using namespace std;

priority_queue<int, vector<int>, greater<int>> q;
int N;

int main() {
    int temp, ans = 0;
    scanf("%d", &N);
    for(int i = 0 ; i < N ; i++) {
        scanf("%d", &temp);
        q.push(temp);
    }
    while (!q.empty()) {
        ans = ans + q.top() * N--;
        q.pop();
    }
    cout << ans;
}
