#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

typedef long long ll;

// 전략: -, 0일때 사서 + 에서 판다
bool cmp(pair<ll, ll>& a, pair<ll, ll>& b) {
    if (a.first > b.first) {
        return true;
    } else if (a.first == b.first) {
        if(a.second > b.second) return true;
        else return false;
    } else return false;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    int testcase;
    cin >> testcase;
    while (testcase--) {
        int days;
        vector<pair<ll, ll>> prices;
        cin >> days;
        for(int i = 0 ; i < days ; i++) {
            ll temp;
            cin >> temp;
            prices.push_back({temp, i});
            prices[0].second = 0;
        }
        vector<pair<ll, ll>> prices_sorted = prices;
        sort(prices_sorted.begin(), prices_sorted.end(), cmp);
        int start = 0;
        ll answer = 0;
        for(int i = 0 ; i < days ; i++) {
            for(;start <= prices_sorted[i].second; start++) {
                answer += prices_sorted[i].first - prices[start].first;
            }
        }
        cout << answer << '\n';
    }
    return 0;
}
