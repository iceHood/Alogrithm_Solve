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

#define MAX_DOTS 20

int T, N;
double min_length;
vector<pii> points(MAX_DOTS, {0, 0});
vector<bool> visited(MAX_DOTS, false);

void back_track(int idx, int count, pii length_of_vectors) {
    if (count == N) {
        min_length = min(min_length, sqrt(pow(length_of_vectors.first, 2) + pow(length_of_vectors.second, 2)));
        return;
    }
    while (visited[idx]) {
        idx++;
    }
    int selected1 = idx;
    visited[idx] = true;
    for (int selected2 = idx+1 ; selected2 < N ; selected2++) {
        if (!visited[selected2]) {
            visited[selected2] = true;
            double x = points[selected1].first - points[selected2].first;
            double y = points[selected1].second - points[selected2].second;
            double sum1 = sqrt(pow(length_of_vectors.first + x, 2) + pow(length_of_vectors.second + y, 2));
            double sum2 = sqrt(pow(length_of_vectors.first - x, 2) + pow(length_of_vectors.second - y, 2));
            if (sum1 < sum2) {
                back_track(idx + 1, count + 2, {length_of_vectors.first + x, length_of_vectors.second + y});
            } else {
                back_track(idx + 1, count + 2, {length_of_vectors.first - x, length_of_vectors.second - y});
            }
            visited[selected2] = false;
        }
    }
    visited[idx] = false;
}

int main() {
    fast_io
    cin >> T;
    while (T--) {
        min_length = INT_MAX;
        cin >> N;
        for (int i = 0 ; i < N ; i++) {
            int x, y;
            cin >> x >> y;
            points[i] = {x, y};
        }
        back_track(0, 0, {0, 0});
        cout << min_length;
    }

}
