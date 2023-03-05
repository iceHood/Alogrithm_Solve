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


int N;


int main() {
    cin >> N;
    ull answer = 0;
    for(int i = 1 ; i <= N ; i++) {
        int temp = N / i;
        answer += temp * i;
    }
    cout << answer;
    return 0;
}
