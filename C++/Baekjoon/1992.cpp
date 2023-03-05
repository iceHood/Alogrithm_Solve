#include <iostream>

using namespace std;

void findAnswer(char **arr, int y, int x, int n) {
    char first = arr[y][x];
    
    if (n == 1) {
        cout << first;
        return;
    }
    for (int i = y ; i < y + n ; i++) {
        for (int t = x ; t < x + n ; t++) {
            
            if (first != arr[i][t]) {
                cout << "(";
                findAnswer(arr, y, x, n/2);
                findAnswer(arr, y, x + n/2, n/2);
                findAnswer(arr, y + n/2, x, n/2);
                findAnswer(arr, y + n/2, x + n/2, n/2);
                cout << ")";
                return;
            }
        }
    }
    cout << first;
    return;
}

int main() {
    int n;
    scanf("%d", &n);
    
    char **arr = new char*[n];
    
    for (int i = 0; i < n ; i++) {
        char *temp = new char[n];
        arr[i] = new char[n];
        cin >> temp;
        arr[i] = temp;
    }
    
    findAnswer(arr, 0, 0, n);
}
