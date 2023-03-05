#include <iostream>
using namespace std;

typedef long long ll;

ll sol(ll a, ll b, ll c) {
    if (b == 0) {
        return 1;
    } else if (b == 1) {
        return a;
    } else if (b % 2) {
        return a * sol(a % c, b - 1, c) % c;
    } else {
        ll temp = sol(a % c, b / 2, c);
        return temp * temp % c;
    }
}
int main() {
    ll A, B, C;
    cin >> A >> B >> C;
    
    cout << sol(A % C, B, C);
   
    return 0;
}

//시도1
//vector<int> v;
//long long temp = 1;
//int cntF = 0, cntE;
//int idxF = 0;
//
//for (int i = 0 ; i < B ; i++) {
//    temp *= A;
//    v.push_back(temp % C);
//    cntF++;
//    if (temp > C) {
//        idxF = i;
//        break;
//    }
//}
//
//if (cntF - 1 == B) {
//    cout << v.back();
//    return 1;
//}
//
//temp *= A;
//v.push_back(temp % C);
//cntE = cntF + 1;
//
//while (v[idxF] != v.back()) {
//    temp *= A;
//    v.push_back(temp % C);
//    cntE++;
//    if (cntE >= B) {
//        break;
//    }
//}
//
//int rere = cntE - cntF;
//
//cout << v[v.size() % rere + idxF];
