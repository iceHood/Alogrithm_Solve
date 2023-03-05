#include <iostream>
#include <algorithm>
using namespace std;

int dp[3][100000];
int n, testCase;

void sol() {
    for (int i = 1; i < n; i++) {
        dp[0][i] = dp[0][i] + max(dp[1][i - 1], dp[2][i - 1]);
        dp[1][i] = dp[1][i] + max(dp[0][i - 1], dp[2][i - 1]);
        dp[2][i] = dp[2][i] + max({dp[0][i - 1], dp[1][i - 1], dp[2][i - 1]});
    }
}

void clear() {
    for (int i = 0; i < n ; i++) {
        dp[0][i] = 0;
        dp[1][i] = 0;
        dp[2][i] = 0;
    }
}
int main() {
    
    cin >> testCase;
    
    while (testCase--) {
        cin >> n;
        for (int i = 0; i < 2; i++) {
            for (int t = 0; t < n; t++) {
                scanf("%d", &dp[i][t]);
            }
        }
        sol();
        cout << max({dp[0][n - 1], dp[1][n - 1], dp[2][n - 1]}) << endl;
        clear();
    }
    
    return 0;
}
