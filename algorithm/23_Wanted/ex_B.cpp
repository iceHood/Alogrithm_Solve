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

int M, N;
vector<pii> spaceRead[10];
int space[10][100];

int main() {
    fast_io
    cin >> M >> N;
    int idx = 0;
    for (int i = 0 ; i < M ; i++) {
        for (int t = 0 ; t < N ; t++) {
            int temp;
            cin >> temp;
            spaceRead[i].push_back({temp, t});
        }
        sort(spaceRead[i].begin(), spaceRead[i].end());
        bool justGo = false;
        for(int t = 0 ; t < i ; t++) {
            int j = 0;
            for(; j < N ; j++) {
                if (spaceRead[i][j].first != spaceRead[t][j].first) break;
            }
            if(j == N) justGo = true;
        }
        if (justGo) continue;
        for(int t = 0 ; t < N ; t++) {
            space[idx][spaceRead[i][t].second] = t;
        }
        idx++;
    }
    
    int answer = 0;
    for (int i = 0 ; i < M ; i++) {
        for (int t = i + 1 ; t < M ; t++) {
            int j = 0;
            for(; j < N ; j++) {
                if (space[i][j] != space[t][j]) break;
            }
            if(j == N) answer++;
        }
    }
    
    cout << answer;
    return 0;
}
