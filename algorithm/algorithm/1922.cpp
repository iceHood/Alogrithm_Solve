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

int N, M, edge_num = 0;
int network[1001], height[1001];
priority_queue<pair<int, pii>, vector<pair<int, pii>>, greater<>> pq;

int find_network(int start) {
    return network[start] == start ? start : network[start] = find_network(network[start]);
}

bool unite_network(int a, int b) {
    a = find_network(a); b = find_network(b);
    if(a == b) return true;
    if(height[a] < height[b]) swap(a, b);
    network[b] = a;
    if(height[a] == height[b])
        height[a]++;
    edge_num++;
    return false;
}

int main() {
    cin >> N >> M;
    for(int i = 1 ; i <= N ; i++) {
        network[i] = i;
        height[i] = 1;
    }
    for(int i = 0 ; i < M ; i++) {
        int a, b, c;
        cin >> a >> b >> c;
        pq.push({c, {a, b}});
    }
    int answer = 0;
    while (edge_num < N - 1) {
        int a = pq.top().second.first;
        int b = pq.top().second.second;
        int c = pq.top().first;
        pq.pop();
        if(unite_network(a, b)) continue;
        answer += c;
    }
    cout << answer;
}
