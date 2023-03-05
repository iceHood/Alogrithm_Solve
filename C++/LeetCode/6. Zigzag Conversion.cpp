#include <iostream>
#include <string>
using namespace std;

// 규칙성 row번째 줄은 numRow의 2배 - (row번째 줄 * 2) 의 규칙성을 갖음
class Solution {
public:
    string convert(string s, int numRows) {
        if (numRows == 1) return s;
        string answer = "";
        int zig = 0, zag = 0;
        int s_length = s.length();
        int cur_idx = 0;
        
        for (int row = 1; row <= numRows; row++) {
            cur_idx = row - 1;
            zig = 2 * (numRows - row);
            zag = 2 * (row - 1);
            if (row == 1 || row == numRows) { // row가 시작|마지막일 경우
                while (cur_idx < s_length) {
                    answer.push_back(s[cur_idx]);
                    cur_idx += 2 * (numRows - 1);
                }
            } else { // row가 중간 부분일 경우
                bool isZig = true;
                while (cur_idx < s_length) {
                    answer.push_back(s[cur_idx]);
                    cur_idx += isZig ? zig : zag;
                    isZig = !isZig;
                }
            }
        }
        return answer;
    }
};

int main() {
    Solution s;
    string ff = "PAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHIPAYPALISHI";
    string dd = "PAYPALISHIRING";
    cout << s.convert(dd, 3) << endl;
    return 0;
    
    /*
     PAYPALISHIRING
     row = 1)
     PAYPALISHIRING
     
     row = 2)
     PYAIHRN
     APLSIIG
     
     row = 3)
     P A H N
     APLSIIG
     Y I R
     
     row = 4)
     P  I  N
     A LS IG
     YA HR
     P  I
     
     row = 5)
     P   H
     A  SI
     Y I R
     PL  IG
     A   N
     */
}
