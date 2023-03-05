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

string str;
string bomb;
int global_idx = 0;
char arr[1000000];

bool explosion(int idx) {
    bool toggle = false;
    vector<int> delete_list;
    if(idx > 0) {delete_list.push_back(global_idx-1); toggle = true;}
    for( ; global_idx < str.size() ; global_idx++) {
        if(str[global_idx] == bomb[idx]) {
            toggle = true;
            idx++;
            delete_list.push_back(global_idx);
        } else if (str[global_idx] == bomb[0]) {
            global_idx++;
            if(!explosion(1)) return false;
        } else if (toggle) return false;
        if(idx == bomb.size()) {
            for(int& it : delete_list) {
                arr[it] = 1;
            }
            return true;
        }
    }
    return false;
}

int main() {
    cin >> str >> bomb;
    while(global_idx < str.size()) {
        explosion(0);
        global_idx++;
    }
    string answer;
    for(int i = 0 ; i < str.size() ; i++) {
        if(!arr[i]) {
            answer.push_back(str[i]);
        }
    }
    if(answer.size()) {
        cout << answer;
    } else {
        cout << "FRULA";
    }
}
