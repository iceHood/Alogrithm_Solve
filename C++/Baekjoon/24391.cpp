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

int building[100000], height[100000];

int find_building(int start) {
    return building[start] == start ? start : building[start] = find_building(building[start]);
}

void bridge_building(int a, int b) {
    a = find_building(a); b = find_building(b);
    if (height[a] < height[b]) swap(a, b);
    building[b] = a;
    if (height[a] == height[b])
        height[a]++;
}


int main() {
    fast_io
    int N, M;
    cin >> N >> M;
    
    for(int i = 1 ; i <= N ; i++) { building[i] = i; height[i] = 1;}
    
    for(int i = 0 ; i < M ; i++) {
        int a, b;
        cin >> a >> b;
        bridge_building(a, b);
    }
    
    int result = 0;
    int pre, next;
    cin >> pre;
    for(int i = 1 ; i < N ; i++) {
        cin >> next;
        if(find_building(pre) != find_building(next)) result++;
        pre = next;
    }
    cout << result;
    return 0;
}
