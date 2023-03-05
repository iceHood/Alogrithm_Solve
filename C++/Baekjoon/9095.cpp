#include <iostream>

using namespace std;

int main() {
    int arr[11] = {0, 1, 2, 4, 7, 13, 24, 44, 81, 149, 274};
    int testCase;
    scanf("%d", &testCase);
    while (testCase--) {
        int idx;
        scanf("%d", &idx);
        cout << arr[idx] << "\n";
    }
}
