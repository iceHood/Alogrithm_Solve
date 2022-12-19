#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#include <set>
#include <cmath>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned int ui;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int dp[2][2][3]; // 0 -> max 1 -> min
int N;

int main() {
    fast_io
    cin >> N;
    
    for(int i = 1 ; i <= N ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        dp[0][1][0] = max(dp[0][0][0] + a, dp[0][0][1] + a);
        dp[0][1][1] = max({dp[0][0][0] + b, dp[0][0][1] + b, dp[0][0][2] + b});
        dp[0][1][2] = max(dp[0][0][1] + c, dp[0][0][2] + c);
        
        dp[1][1][0] = min(dp[1][0][0] + a, dp[1][0][1] + a);
        dp[1][1][1] = min({dp[1][0][0] + b, dp[1][0][1] + b, dp[1][0][2] + b});
        dp[1][1][2] = min(dp[1][0][1] + c, dp[1][0][2] + c);
        
        if( i == N) break;
        dp[0][0][0] = dp[0][1][0];
        dp[0][0][1] = dp[0][1][1];
        dp[0][0][2] = dp[0][1][2];
        
        dp[1][0][0] = dp[1][1][0];
        dp[1][0][1] = dp[1][1][1];
        dp[1][0][2] = dp[1][1][2];
    }
    cout << max({dp[0][1][0], dp[0][1][1], dp[0][1][2]}) << ' ' << min({dp[1][1][0], dp[1][1][1], dp[1][1][2]});
}

