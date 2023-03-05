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

int N, M;
vector<int> arr;

void back_track(int last_num, int count) {
    if(arr.size() == M) {
        for(int it : arr) {
            cout << it << ' ';
        }
        cout << '\n';
        return;
    }
    if(last_num < N) {
        arr.push_back(last_num + 1);
        back_track(last_num + 1, count + 1);
        arr.pop_back();
        back_track(last_num + 1, count);
    }
}

int main() {
    fast_io
    cin >> N >> M;
    back_track(0, 0);
}


