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
vector<int> arr;
vector<int> arr2;

void back_track(int count) {
    if(count == M) {
        for(int i : arr2) cout << i << ' ';
        cout << '\n';
        return;
    }
    for(int i = 0 ; i < arr.size() ; i++) {
        arr2.push_back(arr[i]);
        arr.erase(arr.begin() + i);
        back_track(count + 1);
        arr.insert(arr.begin() + i, arr2.back());
        arr2.pop_back();
    }
}

int main() {
    fast_io
    cin >> N >> M;
    for(int i = 0 ; i < N ; i++) {
        int a;
        cin >> a;
        arr.push_back(a);
    }
    
    sort(arr.begin(), arr.end());
    
    back_track(0);
}
