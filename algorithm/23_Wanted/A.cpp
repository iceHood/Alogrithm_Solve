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
vector<int> ggadalum;
int dp[100000];
int answer_p = INT_MIN;
int answer_m = INT_MAX;

void find_answer_1() {
    int sum = 0;
    for(int i = 0 ; i < ggadalum.size() ; i++) {
        sum = max(0, sum) + ggadalum[i];
        answer_p = max(sum, answer_p);
    }
}

void find_answer_2() {
    int sum = 0;
    for(int i = 0 ; i < ggadalum.size() ; i++) {
        sum = min(0, sum) + ggadalum[i];
        answer_m = min(sum, answer_m);
    }
}

int main() {
    cin >> N;
    int prev = 0;
    int one = 0;
    int two = 0;
    cin >> prev;
    if (prev == 1) {
        one++;
    } else two++;
    for(int i = 1 ; i < N ; i++) {
        int temp;
        cin >> temp;
        if(prev != temp) {
            if(prev == 1) {
                ggadalum.push_back(one);
                one = 0;
                two++;
            } else {ggadalum.push_back(-two); two=0; one++;}
            prev = temp;
        } else {
            if(temp == 1) {
                one++;
            }else two++;
        }
    }
    if(one) {
        ggadalum.push_back(one);
    } else {ggadalum.push_back(-two);}
    
    find_answer_1();
    find_answer_2();
    
    cout << max(abs(answer_p), abs(answer_m));
    return 0;
}
