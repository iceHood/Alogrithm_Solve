#include <iostream>

using namespace std;

int main() {
    int N, M;
    cin >> N;
    cin >> M;
    string str;
    cin >> str;
    int NSize = 2 * N + 1;
    int ans = 0;
    int cnt = 0;
    bool wasO = true;
    for (int i = 0 ; i < M ; i++) {
        if (str[i] == 'I') {
            cnt++;
            if (!wasO) {
                cnt = 1;
                wasO = false;
                continue;
            } else if(cnt < NSize) {
                wasO = false;
                if (cnt == NSize) {
                    ans++;
                }
                continue;
            }
            wasO = false;
            ans++;
        } else {
            cnt++;
            if (wasO) {
                cnt = 0;
                wasO = true;
                continue;
            }
            wasO = true;
        }
    }
    cout << ans;
}
