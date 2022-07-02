#include <iostream>
#include <vector>
using namespace std;
typedef long long ll;
typedef vector<vector<ll>> matrix;

ll n;
ll nanugi = 1000000007;

matrix operator* (matrix& a, matrix& b) {
    matrix c(2, vector<ll>(2));
    for (int i = 0; i < 2 ; i++) {
        for (int t = 0 ; t < 2 ; t++) {
            for (int k = 0 ; k < 2 ; k++) {
                c[i][t] += a[i][k] * b[k][t];
            }
            c[i][t] %= nanugi;
        }
    }
    return c;
}

int main() {
    
    cin >> n;
    
    matrix result = {{1, 0}, {0, 1}};
    matrix a = {{1, 1}, {1, 0}};
    
    while (n > 0) {
        if (n % 2 == 1) {
            result = result * a;
        }
        a = a * a;
        n /= 2;
    }
    cout << result[0][1];
    return 0;
}
