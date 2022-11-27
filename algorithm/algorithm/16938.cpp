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

int N, L, R, X;
vector<int> nanido;
vector<int> selection(15, 0);
int answer = 0;
void find_(int n) {
    if(n == N) {
        int mini = INT_MAX;
        int maxa = INT_MIN;
        int sum = 0;
        int num = 0;
        for(int i = 0 ; i < N ; i++) {
            if(selection[i]) {
                mini = min(mini, nanido[i]);
                maxa = max(maxa, nanido[i]);
                sum += nanido[i];
                num++;
            }
        }
        if (sum < L || sum > R || maxa - mini < X || num < 2) return;
        answer++;
        return;
    }
    selection[n] = 1;
    find_(n+1);
    selection[n] = 0;
    find_(n+1);
}

int main() {
    cin >> N >> L >> R >> X;
    for(int i = 0 ; i < N ; i++) {
        int temp;
        cin >> temp;
        nanido.push_back(temp);
    }
    sort(nanido.begin(), nanido.end());
    selection[0] = 1;
    find_(1);
    selection[0] = 0;
    find_(1);
    cout << answer;
}
