#include <iostream>
#include <queue>
#include <cmath>

using namespace std;

int N;
int x;

struct cmp {
    bool operator()(int a, int b) {
        if (abs(a) > abs(b)) {
            return true;
        } else if (abs(a) == abs(b)) {
            if (a > b) {
                return true;
            } else return false;
        } else return false;
    }
};


int main() {
    scanf("%d", &N);
    priority_queue<int, vector<int>, cmp> q;
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
