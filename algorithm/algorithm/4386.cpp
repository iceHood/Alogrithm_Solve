#include <iostream>
#include <queue>
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

struct star {
    int idx;
    double x;
    double y;
};

int n;
star stars[100];
int height[100];
vector<pair<double, pii>> lines;

star find_star(star start) {
    return stars[start.idx].idx == start.idx ? start : stars[start.idx] = find_star(stars[start.idx]);
}

bool unite_star(star a, star b) {
    a = find_star(a); b = find_star(b);
    if(a.idx == b.idx) return true;
    if(height[a.idx] < height[b.idx]) swap(a, b);
    stars[b.idx] = a;
    if(height[a.idx] == height[b.idx])
        height[a.idx]++;
    return false;
}

int main() {
    fast_io
    cin >> n;
    for(int i = 0 ; i < n ; i++) {
        double x, y;
        cin >> x >> y;
        stars[i].idx = i;
        stars[i].x = x;
        stars[i].y = y;
    }
    for(int i = 0 ; i < n ; i++) {
        for(int t = i + 1 ; t < n ; t++) {
            double temp = sqrt(pow(stars[i].x - stars[t].x, 2) + pow(stars[i].y - stars[t].y, 2));
            lines.push_back({temp, {i, t}});
        }
    }
    sort(lines.begin(), lines.end());
    double answer = 0;
    int nedges = 0;
    for(auto it : lines) {
        if(unite_star(stars[it.second.first], stars[it.second.second])) continue;
        answer += it.first;
        nedges++;
        if(nedges == n - 1) break;
    }
    cout << fixed;
    cout.precision(2);
    cout << answer;
}
