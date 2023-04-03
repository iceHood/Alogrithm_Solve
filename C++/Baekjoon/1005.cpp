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

ll search_answer(vector<int> construct_time, vector<int> constraints[], int target) {
    queue<int> q;
    q.push(target);
    vector<ll> temp_time(construct_time.size(), 0);
    temp_time[target] = construct_time[target];
    while (!q.empty()) {
        int now = q.front();
        q.pop();
        ll now_time = temp_time[now];
        for (auto next : constraints[now]) {
            if (temp_time[next] < now_time + construct_time[next]) {
                temp_time[next] = now_time + construct_time[next];
                q.push(next);
            }
        }
    }
    return *max_element(temp_time.begin(), temp_time.end());
}


int main() {
    fast_io
    int test_case;
    cin >> test_case;
    while (test_case--) {
        int N, K;
        cin >> N >> K;
        vector<int> construct_time(N+1, 0);
        vector<int> constraints[1001];
        for (int i = 1 ; i <= N ; i++) {
            cin >> construct_time[i];
        }
        while (K--) {
            int a, b;
            cin >> a >> b;
            constraints[b].push_back(a);
        }
        int target;
        cin >> target;
        cout << search_answer(construct_time, constraints, target) << '\n';
    }
    return 0;
}
