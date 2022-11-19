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

int N, M;
int city[201], height[201];

int find_root_city(int start) {
    return city[start] == start ? start : city[start] = find_root_city(city[start]);
}

void unite_city(int a, int b) {
    a = find_root_city(a); b = find_root_city(b);
    if(a == b) return;
    if(height[a] < height[b]) swap(a, b);
    city[b] = a;
    if(height[a] == height[b])
        height[a]++;
}

int main() {
    fast_io
    cin >> N >> M;
    
    for(int i = 1 ; i <= N ; i++) {
        city[i] = i;
        height[i] = 1;
    }
    
    for(int i = 1 ; i <= N ; i++) {
        for(int t = 1 ; t <= N ; t++) {
            int token;
            cin >> token;
            if (token)
                unite_city(i, t);
        }
    }
    
    int pre, next;
    cin >> pre;
    for(int i = 1 ; i < M ; i++) {
        cin >> next;
        if(find_root_city(pre) != find_root_city(next)) { cout << "NO"; return 0;}
        pre = next;
    }
    cout << "YES";
    return 0;
}
