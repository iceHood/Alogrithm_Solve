#include <iostream>

using namespace std;

int N, K, ans;
int arr[10];

int main() {
    cin >> N >> K;
    for (int i = 0 ; i < N ; i++) {
        cin >> arr[i];
    }
    for (int i = N - 1; i >= 0 ; i--) {
        ans += K / arr[i];
        K %= arr[i];
    }
    cout << ans;
}
