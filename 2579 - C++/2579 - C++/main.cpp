#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int N;
int *score = new int[N];
vector<int> result;

void findPath(int idx, int times, int rst) {
    if (idx == N - 1) {
        result.push_back(rst);
        return;
    }
    if (times < 2 && idx < N - 1) {
        findPath(idx + 1, times + 1, rst + score[idx + 1]);
    }
    if (idx < N - 2) {
        findPath(idx + 2, 1, rst + score[idx + 2]);
    }
}

int main() {
    scanf("%d", &N);
    for (int i = 0 ; i < N ; i++) {
        scanf("%d", &score[i]);
    }
    findPath(-1, 0, 0);
    int max = *max_element(result.begin(), result.end());
    cout << max;
}
