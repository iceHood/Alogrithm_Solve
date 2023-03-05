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

pii parent[501];
int height[501], n, m;

pii find_tree(int start) {
    return parent[start].first == start ? parent[start] : parent[start] = find_tree(parent[start].first);
}

void unite_tree(pii a, pii b) {
    a = find_tree(a.first); b = find_tree(b.first);
    if(height[a.first] < height[b.first]) swap(a, b);
    if(a == b) {a.second = 1; parent[a.first] = a; return;}
    parent[b.first] = a;
    if(a != b && height[a.first] == height[b.first])
        height[a.first]++;
}

int main() {
    fast_io
    int caseNum = 1;
    while (1) {
        cin >> n >> m;
        if(!n) break;
        for(int i = 1 ; i <= n ; i++) {
            parent[i] = {i, 0};
            height[i] = 1;
        }
        for(int i = 0 ; i < m ; i++) {
            int a, b;
            cin >> a >> b;
            unite_tree(parent[a], parent[b]);
        }
        int answer = 0;
        for(int i = 1 ; i <= n ; i++) {
            bool isCycle = false;
            bool isTree = false;
            for(int t = 1 ; t <= n; t++) {
                pii temp = find_tree(parent[t].first);
                if(temp.first == i && temp.second) {
                    isCycle = true;
                } else if (temp.first == i && !temp.second) {
                    isTree = true;
                }
            }
            if(isCycle) continue;
            if(isTree) answer++;
        }
        cout << "Case " << caseNum << ": ";
        if(answer) {
            if(answer == 1) {
                cout << "There is one tree.\n";
            }else {
                cout << "A forest of " << answer << " trees.\n";
            }
        } else {
            cout << "No trees.\n";
        }
        caseNum++;
    }
    return 0;
}
