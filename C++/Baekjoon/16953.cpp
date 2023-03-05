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

int A, B;

int find_one(int count, ll num) {
    if (num > B) return -1;
    if (num == B) return count;
    int a = find_one(count + 1, num * 2);
    int b = find_one(count + 1, num * 10 + 1);
    if(a == -1 && b == -1) return -1;
    else if (a != -1 && b == -1) return a;
    else if (a == -1 && b != -1) return b;
    else return min(a, b);
}
int main() {
    cin >> A >> B;
    cout << find_one(1, A);
}
