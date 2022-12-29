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

int N, M;

void back_track(int start) {
    static vector<int> arr;
    if(M == arr.size()) {
        for(int it : arr) cout << it << ' ';
        cout << '\n';
        return;
    }
    for(int i = start ; i <= N ; i++) {
        arr.push_back(i);
        back_track(i);
        arr.pop_back();
    }
}

int main() {
    fast_io
    cin >> N >> M;
    back_track(1);
}
