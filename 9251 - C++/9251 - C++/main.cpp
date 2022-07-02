#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int dp[1001][1001], i, t;
int main() {
    string a, b;
    cin >> a >> b;
    
    a.insert(0, "0");
    b.insert(0, "0");
    for (i = 1; i < a.size(); i++) {
        for (t = 1; t < b.size(); t++) {
            dp[i][t] = max({dp[i][t - 1], dp[i - 1][t], dp[i - 1][t - 1] + (a[i] == b[t])});
        }
    }
    cout << dp[i - 1][t - 1];
    return 0;
}
