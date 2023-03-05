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

int robots[1000001], robot_parts[1000001];
int N;

int find_robot(int start) {
    return robots[start] == start ? start : robots[start] = find_robot(robots[start]);
}

void union_robot(int a, int b) {
    a = find_robot(a); b = find_robot(b);
    if(a != b) {
        robots[b] = a;
        robot_parts[a] += robot_parts[b];
    }
}

int main() {
    fast_io
    cin >> N;
    for(int i = 1 ; i <= 1000000 ; i++) {
        robots[i] = i;
        robot_parts[i] = 1;
    }
    for(int i = 0 ; i < N ; i++) {
        char token;
        int a, b;
        cin >> token;
        if(token == 'I') {
            cin >> a >> b;
            union_robot(a, b);
        } else {
            cin >> a;
            cout << robot_parts[find_robot(a)] << '\n';
        }
    }
}
