#include <iostream>
using namespace std;

int main() {
    
    int n, m, temp, sum = 0;
    int arr[100001];
    
    scanf("%d %d", &n, &m);
    
    for (int i = 1 ; i <= n ; i++) {
        scanf("%d", &temp);
        sum += temp;
        arr[i] = sum;
    }
    arr[0] = 0;
    
    int start, end;
    
    while (m--) {
        scanf("%d %d", &start, &end);
        cout << arr[end] - arr[start - 1] << "\n";
    }
    
    return 0;
}
