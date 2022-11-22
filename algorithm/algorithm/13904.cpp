#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int N;
priority_queue<int> pq;
vector<queue<int>> v(1001);

int main() {
    
    cin >> N;
    int last_day = 0;
    for(int i = 0 ; i < N ; i++) {
        int idx, val;
        cin >> idx >> val;
        v[idx].push(val);
        last_day = max(last_day, idx);
    }
    
    int answer = 0;
    for(int i = last_day ; i > 0 ; i--) {
        while (!v[i].empty()) {
            pq.push(v[i].front());
            v[i].pop();
        }
        if(!pq.empty()) {
            answer += pq.top();
            pq.pop();
        }
    }
    
    cout << answer;
    
    return 0;
}
