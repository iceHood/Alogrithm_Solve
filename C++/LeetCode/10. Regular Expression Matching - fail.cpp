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

struct Token {
public:
    char c;
    char type;
    int cnt = 0;
};

class Solution {
public:
    bool isMatch(string s, string p) {
        stacking(p);
        
        int count = 0;
        for(Token& temp : tokens) {
            count += temp.cnt;
        }
        for( ; count < s.size() ; count++) {
            for(int i = 0 ; i < tokens.size() ; i++) {
                Token temp = tokens[i];
                if(temp.type != '*') continue;
                temp.cnt++;
                bool shouldUpdate = false;
                int t = 0, j = 0 ;
                for(; t < s.size() ; t++) {
                    if(tokens[j].type == 'c') {
                        if(isRight(s[t], tokens[j].c)) j++;
                    } else if (tokens[j].type == '.') {
                        if(isRight(s[t], tokens[j].c)) j++;
                    } else {
                        int k = 0;
                        if(i == j) {
                            while (k < temp.cnt && t < s.size()) {
                                if(!isRight(s[t], temp.c)) break;
                                k++;
                                t++;
                            }
                            if(k == temp.cnt) shouldUpdate = true;
                            break;
                        } else {
                            while (k < tokens[j].cnt && t < s.size()) {
                                if(!isRight(s[t], tokens[j].c)) break;
                                k++;
                                t++;
                            }
                            if(t == s.size()) break;
                            j++;
                            t--;
                        }
                    }
                }
                if(shouldUpdate) {
                    tokens[i] = temp;
                    if()
                    if(test(s))
                        break;
                    else tokens[i].cnt--;
                }
            }
            
        }
        if(count > s.size()) return false;
        return test(s);
    }
private:
    vector<Token> tokens;
    
    inline bool isRight(char& s, char& p) {
        return s == p || p == '.';
    }
    
    void stacking(string& p) {
        for(int i = p.size() - 1 ; i >= 0 ; i--) {
            Token temp;
            if(p[i] == '*') {
                temp.c = p[--i];
                temp.type = '*';
                
            } else if (p[i] == '.') {
                temp.c = '.';
                temp.type = '.';
                temp.cnt = 1;
            } else {
                temp.c = p[i];
                temp.type = 'c';
                temp.cnt = 1;
            }
            tokens.push_back(temp);
        }
        reverse(tokens.begin(), tokens.end());
    }
    
    bool test(string& s) {
        int t = 0, j = 0 ;
        for(; t < s.size() && j < tokens.size() ; t++, j++) {
            if(tokens[j].type == 'c') {
                if(isRight(s[t], tokens[j].c)) continue;
                else break;
            } else if (tokens[j].type == '.') {
                if(isRight(s[t], tokens[j].c)) continue;
                else break;
            } else {
                int k = 0;
                while (k < tokens[j].cnt && t < s.size()) {
                    if(!isRight(s[t], tokens[j].c)) return false;
                    k++;
                    t++;
                }
                t--;
            }
        }
        if(t == s.size()) return true;
        else return false;
    }
};


int main() {
    Solution s;
    string a = "mississippi";
    string b = "mis*is*ip*.";
    cout << s.isMatch(a, b);
    return 0;
}

//"aab"
// "c*a*b"
