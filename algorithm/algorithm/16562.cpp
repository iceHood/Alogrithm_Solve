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
ll k;
int friend_group[10001], friend_fee[10001], height[10001];
vector<int> answer(10001, INT_MAX);

int find_friend_group(int start) {
    return friend_group[start] == start ? start : friend_group[start] = find_friend_group(friend_group[start]);
}

void unite_firend(int a, int b) {
    a = find_friend_group(a); b = find_friend_group(b);
    if(height[a] < height[b]) swap(a, b);
    friend_group[b] = a;
    if(height[a] == height[b])
        height[a]++;
}

int main() {
    fast_io
    cin >> N >> M >> k;
    for(int i = 1 ; i <= N ; i++) {
        cin >> friend_fee[i];
        friend_group[i] = i;
        height[i] = 1;
    }
    
    for(int i = 0 ; i < M ; i++) {
        int a, b;
        cin >> a >> b;
        unite_firend(a, b);
    }
    
    for(int i = 1 ; i <= N ; i++) {
        int a = find_friend_group(i);
        answer[a] = min(answer[a], friend_fee[i]);
    }
    
    ll result = 0;
    for(int i = 1 ; i <= N; i++) {
        result += (answer[i] == INT_MAX ? 0 : answer[i]);
    }
    
    if(result > k ) cout << "Oh no";
    else cout << result;
    return 0;
}
