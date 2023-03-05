#include <iostream>
#include <string>
#include <algorithm>
#include <vector>
using namespace std;

//class Solution {
//public:
//    string longestPalindrome(string s) {
//        string ans = "";
//        vector<string> temps;
//        for (int i = 0 ; i < s.size(); i++) {
//            for (int t = i ; t < s.size(); t++) {
//                string temp1 = s.substr(i, t - i + 1);
//                if (find(temps.begin(), temps.end(), temp1) != temps.end()) continue;
//                string temp2 = temp1;
//                reverse(temp2.begin(), temp2.end());
//                if(temp1.compare(temp2) == 0) {
//                    temps.push_back(temp1);
//                    if (ans.size() < temp1.size()) {
//                        ans = temp1;
//                    }
//                }
//            }
//        }
//        return ans;
//    }
//};

class Solution {
public:
    string longestPalindrome(string s) {
        string ans = "";
        int strLength = s.size();
        for (int i = 0 ; i < strLength; i++) { // 나누는 기준
            string temp = "";
            int left = i;
            int right = i;
            while (0 <= left && right < strLength) {
                if (s[left] == s[right]) {
                    temp = s[left--] + temp + s[right++];
                } else break;
            }
            if (temp.size() > ans.size()) {
                temp.erase(temp.size() / 2, 1);
                ans = temp;
            }
            temp = "";
            left = i;
            right = i + 1;
            while (0 <= left && right < strLength) {
                if (s[left] == s[right]) {
                    temp = s[left--] + temp + s[right++];
                } else break;
            }
            if (temp.size() > ans.size()) {
                ans = temp;
            }
        }
        return ans;
    }
};

int main() {
    Solution s;
    string str = "djfajsbiadbvaoihfjdksaskjldashshafdjkjshfddskjdfhsfdafsdafdsafddfasdfasdafsdafdsfadsfdsadafssadffd";
    cout << "결과: " << s.longestPalindrome(str) << endl;
    return 0;
}
