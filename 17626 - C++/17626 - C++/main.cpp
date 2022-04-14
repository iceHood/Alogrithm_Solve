#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int n;
    int dp[50001];
    dp[1] = 1;
    
    cin >> n;
    
    for (int i = 1 ; i <= n ; i++) {
        dp[i] = dp[1] + dp[i - 1];
        for (int t = 2 ; t * t <= i ; t++) {
            dp[i] = min(dp[i], 1 + dp[i - t * t]);
        }
    }
    cout << dp[n];
    return 0;
}
