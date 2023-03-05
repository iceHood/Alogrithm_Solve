#include <iostream>
#include <map>
#include <string>
using namespace std;

map<pair<int, int>, string> combiMap;

string sumOfString(string s1, string s2) {
    int s1Leng = s1.size() - 1;
    int s2Leng = s2.size() - 1;
    int loopSize;
    if (s1Leng > s2Leng) {
        loopSize = s1Leng;
    } else loopSize = s2Leng;
    
    int tempResult;
    string result = "";
    int carry = 0;
    int a = 0, b = 0;
    while ( true ) {
        if (s1Leng < 0 && s2Leng < 0) break;
        if (s1Leng >= 0) a = s1[s1Leng] - '0';
        else a = 0;
        if (s2Leng >= 0) b = s2[s2Leng] - '0';
        else b = 0;
        tempResult = a + b + carry;
        if (tempResult >= 10) {
            carry = tempResult / 10;
            tempResult = tempResult % 10;
        } else carry = 0;
        result.insert(0, to_string(tempResult));
        if (s1Leng >= 0) s1Leng--;
        if (s2Leng >= 0) s2Leng--;
        
    }
    if (carry > 0) {
        result.insert(0, to_string(carry));
    }
    return result;
}

string combi(int n, int m) {
    if (combiMap.find({n, m}) != combiMap.end()) {
        return combiMap[{n, m}];
    }
    if (m == 0 || m == n) {
        combiMap[{n, m}] = "1";
        return combiMap[{n, m}];
    }
    return combiMap[{n, m}] = sumOfString(combi(n - 1, m - 1), combi(n - 1, m));
}

int main() {
    combiMap[{0, 0}] = "1";
    int n, m;
    cin >> n >> m;
    cout << combi(n, m);
    return 0;
}
