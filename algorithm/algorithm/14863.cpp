#include <iostream>
#include <queue>
#include <stack>
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

int n, k;
int dp[100][100001];
int arr[100][4];

int find_(int idx, int time) {
    if (time < 0) return INT_MIN;
    if (idx == n) return 0;
    if (dp[idx][time] != -1) return dp[idx][time];
    return dp[idx][time] = max(find_(idx + 1, time - arr[idx][0]) + arr[idx][1], find_(idx + 1, time - arr[idx][2]) + arr[idx][3]);
}

int main() {
    cin >> n >> k;
    for(int i = 0 ; i < n ; i++) {
        for(int t = 0 ; t <= k ; t++) {
            dp[i][t] = -1;
        }
    }
    for(int i = 0 ; i < n ; i++) {
        cin >> arr[i][0] >> arr[i][1] >> arr[i][2] >> arr[i][3];
    }
    cout << find_(0, k);
}
