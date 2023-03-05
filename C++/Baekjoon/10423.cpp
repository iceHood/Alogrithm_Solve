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

int N, M, K;

int city[1001];
vector<pair<int, pii>> roads;
vector<int> plant;

int find_city(int start) {
    return city[start] == start ? start : city[start] = find_city(city[start]);
}

bool unite_city(int a, int b) {
    a = find_city(a); b = find_city(b);
    if(a == b) return true; // same parent end
    
    bool is_a_plant = false, is_b_plant = false;
    
    for(int it : plant) {
        if(a == it) is_a_plant = true;
        if(b == it) is_b_plant = true;
    }
    
    if(is_a_plant && is_b_plant) return true; // each set has plant end
    else if (!is_a_plant && is_b_plant) swap(a, b); // if only b has plant connect a to b
    
    city[b] = a;
    return false;
}

int main() {
    fast_io
    cin >> N >> M >> K;
    for(int i = 1 ; i <= N ; i++) {
        city[i] = i;
    }
    for(int i = 0 ; i < K ; i++) {
        int temp;
        cin >> temp;
        plant.push_back(temp);
    }
    for(int i = 0 ; i < M ; i++) {
        int u, v, w;
        cin >> u >> v >> w;
        roads.push_back({w, {u, v}});
    }
    sort(roads.begin(), roads.end());
    int answer = 0;
    int Nedges = 0;
    for(auto it : roads) {
        if(Nedges == N - K) break;
        if(unite_city(it.second.first, it.second.second))  continue;
        answer += it.first;
        Nedges++;
    }
    cout << answer;
}
