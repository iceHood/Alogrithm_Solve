#include <iostream>
#include <map>

using namespace std;

int main() {
    int testCase;
    scanf("%d", &testCase);
    while (testCase--) {
        map<string, int> m;
        int N;
        cin >> N;
        string arr[30];
        int idx = 0, answer = 1;
        while (N--) {
            string a, b;
            cin >> a >> b;
            if (m.find(b) == m.end()) {
                m.insert({b, 1});
                arr[idx++] = b;
            } else m[b] += 1;
        }
        for (int i = 0 ; i < idx; i++) {
            answer *= (m[arr[i]] + 1);
        }
        cout << answer - 1 << "\n";
    }
}
