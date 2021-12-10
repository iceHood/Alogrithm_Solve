#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    vector<pair<int, int>> arr;
    vector<int> answer;
    int num = 0;
    scanf("%d", &num);
    for (int i = 1 ; i <= num ; i++) {
        int a = 0, b = 0;
        scanf("%d %d", &a, &b);
        arr.push_back(pair<int, int>(b, a));
    }
    sort(arr.begin(), arr.end());
    
    int lastTime = 0;
    int cnt = 0;
    
    for (int i = 0 ; i < num ; i++) {
        if (lastTime <= arr[i].second) {
            lastTime = arr[i].first;
            cnt++;
        }
    }
    cout << cnt;
}
