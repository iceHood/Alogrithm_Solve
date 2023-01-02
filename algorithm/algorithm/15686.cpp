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

struct Coordinate {
    int x;
    int y;
};

struct House {
    Coordinate pos;
    House() {pos.x = 0; pos.y = 0;}
    House(int x, int y) {pos.x = x; pos.y = y;}
};

struct Chicken {
    Coordinate pos;
    vector<int> dist;
    Chicken() {pos.x = 0; pos.y = 0;}
    Chicken(int x, int y) {pos.x = x; pos.y = y;}
};

struct City {
    vector<House> houses;
    vector<Chicken> chickens;
    int map[50][50];
};

int N, M;
City c;
vector<int> selectedChickens;
vector<int> answers;

void solution() {
    int sum = 0;
    for(int i = 0 ; i < c.houses.size() ; i++) {
        int minNum = INT_MAX;
        for(int& t : selectedChickens)
            minNum = min(minNum, c.chickens[t].dist[i]);
        sum += minNum;
    }
    answers.push_back(sum);
}

void back_tracking(int idx) {
    if(M == selectedChickens.size()) {
        solution();
        return;
    }
    
    for(int i = idx ; i < c.chickens.size() ; i++) {
        selectedChickens.push_back(i);
        back_tracking(i + 1);
        selectedChickens.pop_back();
    }
    
}

int main() {
    cin >> N >> M;
    for(int i = 0 ; i < N ; i++) {
        for(int t = 0 ; t < N ; t++) {
            cin >> c.map[i][t];
            if(c.map[i][t] == 1)
                c.houses.push_back(House(i, t));
            else if(c.map[i][t] == 2)
                c.chickens.push_back(Chicken(i, t));
        }
    }
    
    for(auto& it : c.chickens) {
        for(auto t = c.houses.begin() ; t != c.houses.end() ; t++) {
            it.dist.push_back(abs(t->pos.x - it.pos.x) + abs(t->pos.y - it.pos.y));
        }
    }
    
    back_tracking(0);
    cout << *min_element(answers.begin(), answers.end());
}
