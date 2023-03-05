#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// _int32 범위: -2,147,483,648 ~ 2,147,483,647
// 1000000009
// 범위를 벗어날 경우 바로 런타임에러 발생
// try catch 안 먹음 ㅋㅋㅋ
// 만약.... string으로 한다면...?
// 이런..

class Solution {
public:
    int reverse(int x) {
        int result = 0;
        while (x > 0) {
            int to_put = x % 10;
            if (result > INT_MAX / 10 || (result == INT_MAX / 10 && to_put > INT_MAX % 10)) {
                return 0;
            }
            if (result < INT_MIN / 10 || (result == INT_MIN / 10 && to_put < INT_MIN % 10)) {
                return 0;
            }
            result = result * 10 + to_put;
            x /= 10;
        }
        return result;
    }
};

int main() {
    Solution s;
    int32_t a = -1000000009;
//    cout << s.reverse(a)<< endl;
    string s1 = "2147483648";
    string s2 = "2147483648";
    cout << s.reverse(a) << endl;
}
