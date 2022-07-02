#include <iostream>
#include <vector>
using namespace std;

vector<int> v[10000];
int n;

int myMax(int x, int y) {
    if (x < y) {
        return y;
    } else return x;
}
int main() {
    cin >> n;
    for (int i = 0 ; i < n ; i++) {
        for (int t = 0; t < i + 1; t++) {
            int temp;
            scanf("%d", &temp);
            v[i].push_back(temp);
        }
    }
    for (int i = 1 ; i < n ; i++) {
        v[i][0] += v[i - 1][0];
        v[i][i] += v[i - 1][i - 1];
        for (int t = 1 ; t < i ; t++) {
            v[i][t] = myMax(v[i - 1][t - 1] + v[i][t], v[i - 1][t] + v[i][t]);
        }
    }
    int answer = 0;
    for (int i = 0 ; i < n ; i++) {
        answer = myMax(v[n - 1][i], answer);
    }
    cout << answer;
    return 0;
}
