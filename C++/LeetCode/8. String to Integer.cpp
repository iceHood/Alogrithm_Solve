#include <iostream>
#include <string>
#include <climits>
using namespace std;


class Solution {
public:
    int myAtoi(string s) {
        int idx = 0;
        eraseFrontSpace(s, idx); // "      44"
        bool isNegative = checkNegative(s, idx); // +22, -33, 44
        eraseFrontZero(s, idx); // -000023
        
        string temp = "";
        
        for(; s[idx] && checkNumber(s[idx]) ; idx++) temp += s[idx];
        
        int result = 0;
        for(auto it : temp) {
            int to_put = it - '0';
            if (!isNegative && (result > INT_MAX / 10 || (result == INT_MAX / 10 && to_put >= INT_MAX % 10))) {
                return INT_MAX;
            }
            if (isNegative && (-result < INT_MIN / 10 || (-result == INT_MIN / 10 && -to_put <= INT_MIN % 10))) {
                return INT_MIN;
            }
            result = result * 10 + to_put;
        }
        
        
        return isNegative ? -result : result;
    }
private:
    void eraseFrontSpace(string& s, int& idx) {
        while (s[idx] == ' ') idx++;
    }
    
    bool checkNegative(string& s, int& idx) {
        if (s[idx] == '-') {
            idx++;
            return true;
        } else if (s[idx] == '+') {
            idx++;
            return false;
        } else return false;
    }
    
    void eraseFrontZero(string& s, int& idx) {
        while(s[idx] == '0') idx++;
    }
    
    inline bool checkNumber(char& c) {
        return '0' <= c && c <= '9';
    }
    
};

int main() {
    Solution s;
//    string temp = "              fu d";
//    s.myAtoi(temp);
    cout << INT_MIN;
    return 0;
}
