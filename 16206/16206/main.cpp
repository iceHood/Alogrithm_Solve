#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    int cake_num;
    int cut_num;
    int answer = 0;
    vector<int> cakes_10;
    vector<int> cakes_1x;
    
    cin >> cake_num >> cut_num;
    for(int i = 0 ; i < cake_num ; i++) {
        int temp;
        cin >> temp;
        if (temp - 10 == 0) {
            answer++;
        } else if (temp % 10 == 0) {
            cakes_10.push_back(temp);
        } else cakes_1x.push_back(temp - temp % 10);
    }
    sort(cakes_10.begin(), cakes_10.end());
    for(int i = 0 ; i < cakes_10.size() ; i++) {
        int temp = cakes_10[i];
        cut_num -= temp / 10 - 1;
        if (cut_num < 0) {
            answer += (temp / 10 - 1) + cut_num;
            cout << answer;
            return 0;
        } else answer += temp / 10;
    }
    
    for(int i = 0 ; i < cakes_1x.size() ; i++) {
        int temp = cakes_1x[i];
        cut_num -= temp / 10;
        if (cut_num < 0) {
            answer += (temp / 10) + cut_num;
            cout << answer;
            return 0;
        } else answer += temp / 10;
    }
    
    cout << answer;
    return 0;
}
