#include <iostream>
#include <queue>
#include <string>

using namespace std;

int main() {
    int testCase;
    cin >> testCase;
    while (testCase--) {
        int A, B;
        cin >> A >> B;
        bool visited[10000] = { false, };
        queue<pair<int, string>> q;
        q.push({A, ""});
        visited[A] = true;
        while (!q.empty()) {
            int cen = q.front().first;
            string str = q.front().second;
            q.pop();
            if (cen == B) {
                cout << str << "\n";
                break;
            }
            int D, S, L, R;
            D = cen * 2 % 10000;
            if (!visited[D]) {
                visited[D] = true;
                q.push({D, str + "D"});
            }
            S = cen - 1 < 0 ? 9999 : cen - 1;
            if (!visited[S]) {
                visited[S] = true;
                q.push({S, str + "S"});
            }
            L = cen % 1000 * 10 + cen / 1000;
            if (!visited[L]) {
                visited[L] = true;
                q.push({L, str + "L"});
            }
            R = cen % 10 * 1000 + cen / 10;
            if (!visited[R]) {
                visited[R] = true;
                q.push({R, str + "R"});
            }
        }
    }
}
