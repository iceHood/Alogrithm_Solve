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

int N;
queue<int> q;

inline void print_one() {
    cout << "*";
}

inline void print_two() {
    cout << "* *";
}

inline void print_five() {
    cout << "*****";
}

void print_blank(int n) {
    if(n == 0) return;
    string s(n, ' ');
    cout << s;
}

int main() {
    fast_io
    cin >> N;
    print_blank(N-1);
    q.push(-1);
    int count = 1;
    int type_token = -1;
    bool front_added = false;
    int five_num = 0;
    while (!q.empty()) {
        switch (q.front()) {
            case -1:
                print_one();
                front_added = false;
                q.push(-2);
                break;
            case -2:
                print_two();
                q.push(-5);
                break;
            case -5:
                print_five();
                five_num++;
                break;
            default:
                print_blank(q.front());
                if(q.front() - 2 > 0) q.push(q.front() - 2);
                break;
        }
        q.pop();
        if(!(count % 3)) {
            if(!front_added && q.front() <= 1) {
                q.push(-1);
                front_added = true;
            } else if(!front_added && q.front() > 1) {
                five_num = 0;
                q.push(-1);
                q.push(5);
                q.push(-1);
            } else if(front_added && q.front() > 1) {
                q.push(five_num * 5 + five_num - 1);
                q.push(-1);
                five_num = 0;
                front_added = false;
            }
        }
        if(q.front() < 0) {
            if(type_token != q.front()) {
                if(count == N) break;
                type_token = q.front();
                count++;
                print_blank(N - count + 1);
                cout << '\n';
                print_blank(N - count);
                if(front_added) {
                    q.push(five_num * 5 + five_num - 1);
                    q.push(-1);
                    five_num = 0;
                    front_added = false;
                }
            }
        }
    }
}
