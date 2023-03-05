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

int N, K;
vector<pii> items;
int dp[100001];

// max(이걸 담았을 때 최대 가치, 이걸 담지 않았을 때 최대 가치)
// 다음 가치 = 이전 가치 + 현재 담는 것
int find_(int idx, int weight) {
    if(weight + items[idx].first > K) return dp[weight];
    if(dp[weight] + items[idx].second > dp[weight+items[idx].first]) dp[weight+items[idx].first] = dp[weight] + find_(idx+1, weight+items[idx].first);
    dp[weight] = find_(idx+1, weight);
    return 1;
}

int main() {
    cin >> N >> K;
    for(int i = 0 ; i < N ; i++) {
        int w, v;
        cin >> w >> v;
        if(w > K) continue;
        items.push_back({w, v});
    }
    sort(items.begin(), items.end());
    
}
