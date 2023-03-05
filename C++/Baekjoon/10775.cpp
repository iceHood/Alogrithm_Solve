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

int G, P;
int gate[100001];

int find_gate(int start) {
    return gate[start] == start ? start : gate[start] = find_gate(gate[start]);
}

bool use_gate(int a) {
    int b = a - 1;
    a = find_gate(a); b = find_gate(b);
    if(a == b) {
        if(a == 0) {return true;}
        b = find_gate(b-1);
    }
    if(a > b) swap(a, b);
    gate[b] = a;
    return false;
}

int main() {
    fast_io
    cin >> G >> P;
    for(int i = 1 ; i <= G ; i++) {
        gate[i] = i;
    }
    for(int i = 0 ; i < P ; i++) {
        int a;
        cin >> a;
        if(use_gate(a)) { cout << i; return 0;}
    }
    cout << P;
    return 0;
}
