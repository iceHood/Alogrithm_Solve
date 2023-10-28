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
vector<int> list;

void back_track(int count) {
    if(count == M) {
        for(int temp : arr) cout << temp << ' ';
        cout << '\n';
        return;
    }
    int prev = -1;
    for(int i = 0 ; i < list.size() ; i++) {
        int temp = list[i];
        if(temp == 0 || temp == prev) {continue;}
        arr.push_back(temp);
        list[i] = 0;
        back_track(count+1);
        list[i] = temp;
        arr.pop_back();
        prev = temp;
    }
}

int main() {
    fast_io
    cin >> N >> M;
    for(int i = 0; i < N; i++) {
        int temp;
        cin >> temp;
        list.push_back(temp);
    }
    sort(list.begin(), list.end());
    back_track(0);
    
    return 0;
}
