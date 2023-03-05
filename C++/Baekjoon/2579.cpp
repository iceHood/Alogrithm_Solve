#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int N;
int *score = new int[N];

int main() {
    scanf("%d", &N);
    for (int i = 0 ; i < N ; i++) {
        scanf("%d", &score[i]);
    }
    int DP[300] = {0};
    DP[0] = score[0];
    DP[1] = score[0] + score[1];
    DP[2] = max(score[0] + score[2], score[1] + score[2]);
    for (int i = 3 ; i < N ; i++) {
        DP[i] = max(score[i] + DP[i - 2], score[i] + score[i - 1] + DP[i - 3]);
    }
    cout << DP[N - 1];
}
