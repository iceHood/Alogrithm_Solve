#include <iostream>
using namespace std;

int color[1001][3];
int dp[1001][3];
int N;

int myMin(int x, int y) {
    if (x < y) {
        return x;
    } else return y;
}

int main() {
    cin >> N;
    for (int i = 1 ; i <= N ; i++) {
        for (int t = 0 ; t < 3 ; t++) {
            scanf("%d", &color[i][t]);
        }
    }
    color[0][0] = color[0][1] = color[0][2] = dp[0][0] = dp[0][1] = dp[0][2] = 0;
    for (int i = 1 ; i <= N ; i++) {
        dp[i][0] = myMin(dp[i - 1][1], dp[i - 1][2]) + color[i][0];
        dp[i][1] = myMin(dp[i - 1][0], dp[i - 1][2]) + color[i][1];
        dp[i][2] = myMin(dp[i - 1][0], dp[i - 1][1]) + color[i][2];
    }
    cout << myMin(myMin(dp[N][0], dp[N][1]), dp[N][2]);
    return 0;
}

//시도2
//void sol(int x, int y) {
//    if (x == N) {
//        if (min2 > dp[x - 1]) {
//            min2 = dp[x - 1];
//        }
//        return;
//    }
//    for (int i = 0 ; i < 3 ; i++) {
//        if (i == y) continue;
//        dp[x] = dp[x - 1] + color[x][i];
//        sol(x + 1, i);
//    }
//    return;
//}
//
//for (int i = 0 ; i < 3 ; i++) {
//    dp[0] = color[0][i];
//    sol(1, i);
//}
//cout << min2;


//시도1
//int idx = -1;
//int tempI = -1;
//int min = 2000, sum = 0;
//for (int i = 0 ; i < N ; i++) {
//    min = 2000;
//    for (int t = 0 ; t < 3; t++) {
//        if (min > color[i][t] && idx != t) {
//            min = color[i][t];
//            tempI = t;
//        }
//    }
//    sum += min;
//    idx = tempI;
//    cout << idx << ' ' << min << ' ' << sum << endl;
//}
//cout << sum;
