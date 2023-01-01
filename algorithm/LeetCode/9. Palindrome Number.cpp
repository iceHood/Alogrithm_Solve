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

class Solution {
public:
    bool isPalindrome(int x) {
        int temp = x;
        if(x < 0) return false;
        int to_compare = 0;
        while (temp) {
            to_compare = to_compare * 10 + temp % 10;
            temp /= 10;
        }
        return to_compare == x;
    }
};

int main() {
    Solution s;
    cout << s.isPalindrome(121);
    
    return 0;
}
