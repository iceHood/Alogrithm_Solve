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
#include <unordered_map>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned int ui;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

using namespace std;

int main() {
    fast_io
    int n;
    cin >> n;
    
    for (int i = 0; i < n; i++) {
        unordered_map<ll, int> soldiers;
        bool a = false;
        int lim;
        ll answer = 0;
        cin >> lim;
    
        for (int j = 0; j < lim; j++) {
            ll temp;
            cin >> temp;
            if(a) continue;
            if (soldiers.find(temp) != soldiers.end()) {
                soldiers[temp]++;
                if (soldiers[temp] > lim / 2) {
                    a = true;
                    answer = temp;
                }
            } else {
                soldiers[temp] = 1;
            }
        }
        
        if (!a) {
            cout << "SYJKGW" << endl;
        } else {
            cout << answer << endl;
        }
    }
    return 0;
}
