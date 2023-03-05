#include <iostream>

using namespace std;

long long P[101] = {0, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9};

int main() {
    for (int i = 10; i < 100 ; i++) {
        P[i + 1] = P[i] + P[i - 4];
    }
    int testCase;
    cin >> testCase;
    while (testCase--) {
        int n;
        scanf("%d", &n);
        cout << P[n] << "\n";
    }
}
