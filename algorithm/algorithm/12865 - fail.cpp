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

int N, K;
int dp[100][100000];
vector<pii> goods;

int find_answer(int idx, int weight) {
    if(idx >= N) return 0;
    if(dp[idx][weight] != 0) return dp[idx][weight];
    if(weight - goods[idx].first >= 0) return dp[idx][weight] = max({dp[idx][weight], find_answer(idx + 1, weight - goods[idx].first) + goods[idx].second, find_answer(idx + 1, weight)});
    else return dp[idx][weight] = max(dp[idx][weight], find_answer(idx + 1, weight));
}

int main() {
    cin >> N >> K;
    
    for(int i = 0 ; i < N ; i++) {
        int W, V;
        cin >> W >> V;
        goods.push_back({W, V});
    }
    
    cout << find_answer(0, K);
    return 0;
}
