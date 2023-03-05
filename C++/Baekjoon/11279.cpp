#include <iostream>
#include <queue>

using namespace std;

int N, x;
priority_queue<int> q;
int main() {
    scanf("%d", &N);
    while (N--) {
        scanf("%d", &x);
        if (x == 0) {
            if (!q.empty()) {
                cout << q.top() << "\n";
                q.pop();
            } else cout << 0 << "\n";
        } else q.push(x);
    }
}
