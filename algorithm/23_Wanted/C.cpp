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

int N, M, C;
ull W[16][16];
vector<int> A, B;
ull answer = 0;

void backTrack(int AIdx, int BIdx, ull count) {
    if(AIdx == A.size() || BIdx == B.size()) {
        answer = max(answer, count);
        return;
    }
    
    for(int i = BIdx ; i < B.size(); i++) {
        backTrack(AIdx + 1, i + 1, count + W[A[AIdx]][B[i]]);
    }
}



int main() {
    cin >> N >> M >> C;
    for(int i = 0 ; i < C ; i++) {
        for(int t = 0 ; t < C ; t++) {
            cin >> W[i][t];
        }
    }
    
    for(int i = 0 ; i < N ; i++) {
        int temp;
        cin >> temp;
        A.push_back(temp-1);
    }
    
    for(int i = 0 ; i < M ; i++) {
        int temp;
        cin >> temp;
        B.push_back(temp-1);
    }
    
    backTrack(0, 0, 0);
    
    cout << answer;
    return 0;
}
