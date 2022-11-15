#include <algorithm>
#include<vector>
#include<stdio.h>
#include <iostream>

#include<stdlib.h>
#define WRONG { printf("WA"); exit(1); }
#define CORRECT {printf("AC"); exit(0); }
using namespace std;

#define mp make_pair
typedef long long ll;
typedef unsigned long long ull;
typedef double db;
typedef long double ldb;
typedef pair <int, int> pii;
typedef pair <ll, ll> pll;
typedef pair <ll, int> pli;
typedef pair <ldb, ldb> pdd;

int IT_MAX = 262144;
const int MOD = 1000000007;
const int INF = 1034567891;
const ll LL_INF = 1234567890123456789ll;
const db PI = 3.141592653589793238;
const ldb ERR = 1E-11;

const int NMX = 1000 + 50;

ll dis[NMX];
int rev[NMX];
bool findNegativeCycle_Wrong(vector <pair<ll, pll>> E, int N) {
    int i, j;
    fill(dis + 1, dis + N + 1, 0);
    for (i = 1; i <= N-2; i++) {
        for (j = 0; j < E.size(); j++) {
            auto u = E[j];
            int s = u.second.first, e = u.second.second;
            if (dis[e] > dis[s] + u.first) {
                dis[e] = dis[s] + u.first;
                rev[e] = j;
            }
        }
    }

    for (j = 0; j < E.size(); j++) {
        auto u = E[j];
        int s = u.second.first, e = u.second.second;
        if (dis[e] > dis[s] + u.first) {
            return true;
        }
    }
    return false;
}

bool findNegativeCycle(vector <pair<ll, pll>> E, int N) {
    int i, j;
    fill(dis + 1, dis + N + 1, 0);
    for (i = 1; i <= N-1; i++) {
        for (j = 0; j < E.size(); j++) {
            auto u = E[j];
            int s = u.second.first, e = u.second.second;
            if (dis[e] > dis[s] + u.first) {
                dis[e] = dis[s] + u.first;
                rev[e] = j;
            }
        }
    }

    for (j = 0; j < E.size(); j++) {
        auto u = E[j];
        int s = u.second.first, e = u.second.second;
        if (dis[e] > dis[s] + u.first) {
            return true;
        }
    }
    return false;
}

bool chk[105][105];

//int main() {
//    int N, M, i;
//    ll t1, t2, t3;
//    vector <pair<ll, pll>> V;
//
//    scanf("%d %d", &N, &M);
//    if( N < 50 || 100 < N || M < 0 || N*(N-1) < M )  { cout <<"0pro" << endl; WRONG;}
//    while (M--) {
//        scanf("%lld %lld %lld", &t1, &t2, &t3);
//        if( t1 < 1 || t1 > N || t2 < 1 || t2 > N ) {cout <<"1pro" << endl;WRONG; }
//        if( (t3 != 1 && t3 != -1) || chk[t1][t2])  {cout <<"2pro" << endl;WRONG; }
//        chk[t1][t2] = true;
//        V.emplace_back(t3, pll(t1, t2));
//    }
//
//    bool ans = findNegativeCycle(V, N);
//    bool wrong = findNegativeCycle_Wrong(V, N);
//    if( !ans && wrong ) CORRECT
//    else WRONG;
//    return 0;
//}

#include <iostream>
using namespace std;
int main() {
    cout << 50 << ' ' << 49 << endl;
    bool token = true;
    for (int i = 50 ; i > 0 ; i--) {
        cout << i << ' ' << i+1 << ' ' << -1 << endl;
    }
}

