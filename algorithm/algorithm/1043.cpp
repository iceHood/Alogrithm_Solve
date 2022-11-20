#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

int N, M;
int people[51], height[51];
vector<int> know_people;
vector<int> party[51];

int find_root(int start) {
    return people[start] == start ? start : people[start] = find_root(people[start]);
}

void unite(int a, int b) {
    a = find_root(a); b = find_root(b);
    if(height[a] < height[b]) swap(a, b);
    people[b] = a;
    if(height[a] == height[b])
        height[a]++;
}

int main() {
    fast_io
    cin >> N >> M;
    for(int i = 1 ; i <= N ; i++) {
        people[i] = i;
        height[i] = 1;
    }
    {
        int temp;
        cin >> temp;
        for(int i = 0 ; i < temp ; i++) {
            int t;
            cin >> t;
            know_people.push_back(t);
        }
    }
    for(int i = 1 ; i <= M ; i++) {
        int temp, pre, next;
        cin >> temp;
        if(temp) {cin >> pre; party[i].push_back(pre);}
        for(int t = 1 ; t < temp ; t++) {
            cin >> next;
            unite(pre, next);
            party[i].push_back(next);
            next = pre;
        }
    }
    
    int answer = 0;
    for(int i = 1 ; i <= M ; i++) {
        bool is_know_truth = false;
        for(auto person : party[i]) {
            for(auto know_person : know_people) {
                if(find_root(person) == find_root(know_person)) {is_know_truth = true; break;}
            }
            if(is_know_truth) break;
        }
        answer += (is_know_truth ? 0 : 1);
    }
    cout << answer;
}
