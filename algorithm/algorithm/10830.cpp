#include <iostream>
#include <queue>
#include <stack>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#include <set>
#include <cmath>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned int ui;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int N;
ull B;

int arr[5][5];
int arr2[5][5];
int result[5][5];

void multiple_vector_() {
    int temp[N][N];
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < N; t++) {
            temp[i][t] = result[i][t];
        }
    }
    for(int i = 0 ; i < N ; i++) {
        for(int j = 0 ; j < N ; j++) {
            int sum = 0;
            for(int t = 0 ; t < N ; t++) {
                sum += temp[i][t] * arr2[t][j];
            }
            result[i][j] = sum % 1000;
        }
    }
}

void multiple_vector_self() {
    int temp[N][N];
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < N; t++) {
            temp[i][t] = arr2[i][t];
        }
    }
    for(int i = 0 ; i < N ; i++) {
        for(int j = 0 ; j < N ; j++) {
            int sum = 0;
            for(int t = 0 ; t < N ; t++) {
                sum += temp[i][t] * temp[t][j];
            }
            arr2[i][j] = sum % 1000;
        }
    }
}

void init_vect() {
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < N; t++) {
            arr2[i][t] = arr[i][t];
        }
    }
}

int main() {
    cin >> N >> B;
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < N ; t++) {
            cin >> arr[i][t];
            result[i][t] = arr[i][t];
        }
    }
    
    ull count = 1;
    while (B - count) {
        init_vect();
        ull temp = 1;
        while (1) {
            if(B - count < temp * 2) break;
            temp *= 2;
            multiple_vector_self();
        }
        multiple_vector_();
        count += temp;
    }
    
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < N ; t++) {
            cout << result[i][t] % 1000 << ' ';
        }
        cout << '\n';
    }
}
