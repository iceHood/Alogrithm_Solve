#include <iostream>
#include <vector>
using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    int n;
    cin >> n;
    vector<int> sum_arr;
    int temp_sum = 2;
    int before;
    cin >> before;
    int temp;
    cin >> temp;
    bool isInc = before < temp;
    before = temp;
    for(int i = 2 ; i < n ; i++) {
        cin >> temp;
        if(isInc && before < temp) { // 이전 상승, 지금 상승
            temp_sum++;
        } else if(isInc && before > temp) { // 이전 상승, 지금 하강
            if(temp_sum >= 3) {
                sum_arr.push_back(temp_sum);
                temp_sum = 2;
            } else {
                temp_sum = 1;
            }
            isInc = false;
        } else if(!isInc && before < temp) { // 이전 하강, 지금 상승
            if(temp_sum >= 3) {
                sum_arr.push_back(temp_sum);
                temp_sum = 2;
            } else {
                temp_sum = 1;
            }
            isInc = true;
        } else { // 이전 하강, 지금 하강
            temp_sum++;
        }
        before = temp;
    }
    if(temp_sum >= 3) sum_arr.push_back(temp_sum);
    unsigned long long answer = 0;
    for(auto it = sum_arr.begin() ; it != sum_arr.end(); it++) answer += (unsigned long long) *it;
    cout << answer;
    return 0;
}
