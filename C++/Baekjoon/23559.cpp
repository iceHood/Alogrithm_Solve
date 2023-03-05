#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

inline bool cmp(pair<pair<int, int>, int> a, pair<pair<int, int>, int> b) {
    return a.second < b.second;
}

int main() {
    vector<pair<pair<int, int>, int>> mat;
    int N, X;
    cin >> N >> X;
    for (int i = 0 ; i < N ; i++) {
        int A, B;
        cin >> A >> B;
        mat.push_back({{A, B}, B - A});
    }
    int eat_A;
    eat_A = (X - (N * 1000)) / 4000;
    sort(mat.begin(), mat.end(), cmp);
    int result = 0;
    for (int i = 0 ; i < N ; i++) {
        if(mat[i].second < 0) {
            result += eat_A > 0 ? mat[i].first.first : mat[i].first.second;
            eat_A--;
        } else result += mat[i].first.second;
    }
    
    cout << result;
    return 0;
}
