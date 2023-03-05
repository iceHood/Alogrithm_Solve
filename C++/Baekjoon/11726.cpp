#include <iostream>
using namespace std;
/*
int fact(int x) {
    int sum = 1;
    if (x == 1 || x == 0) {
        return 1;
    }
    for (int i = 1; i <= x; i++) {
        sum *= i;
    }
    return sum;
}

int main() {
    int num1, num2, sum = 0, n;
    cin >> n;
    num1 = n % 2;
    num2 = n / 2;
    
    do {
        n = num1 + num2;
        sum += fact(n) / fact(num1) / fact(num2);
        num1 += 2;
    } while (num2--);
    
    cout << sum << endl;
    cout << sum % 10007;
    
    return 0;
}
*/

int main() {
    int n;
    int dp[1001];
    dp[0] = dp[1] = 1;
    cin >> n;
    for (int i = 2 ; i <= n ; i++) {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007;
    }
    cout << dp[n];
    return 0;
}
