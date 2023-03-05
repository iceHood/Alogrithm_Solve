#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <map>
using namespace std;
// 가장 비싼것들 순 -> 가장 가벼운 순 -> 가장 가벼운 가방에 담으면 될듯

vector<pair<int, int>> juel;
map<int, int> bag_sum;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    int N, K;
    cin >> N >> K;
    for(int i = 0 ; i < N ; i++) {
        pair<int, int> temp;
        cin >> temp.first >> temp.second;
        juel.push_back(temp);
    }
    sort(juel.begin(), juel.end());
    
    for(int i = 0 ; i < K ; i++) {
        int temp;
        cin >> temp;
        bag_sum[temp]++;
    }
    priority_queue<int> temp_juels;
    auto temp_juel = juel.begin();
    long long answer = 0;
    for(auto it = bag_sum.begin() ; it != bag_sum.end() ; it++) {
        while(temp_juel != juel.end() && temp_juel->first <= it->first) {
            temp_juels.push(temp_juel->second);
            temp_juel++;
        }
        for(int i = 0 ; i < it->second && !temp_juels.empty() ; i++) {
            answer += (long long)temp_juels.top();
            temp_juels.pop();
        }
    }
    cout << answer;
    return 0;
}
