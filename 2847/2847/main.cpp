#include <iostream>
#include <vector>
using namespace std;

int main() {
    int level_num;
    int answer = 0;
    vector<int> levels;
    
    cin >> level_num;
    for(int i = 0 ; i < level_num ; i++) {
        int temp;
        cin >> temp;
        levels.push_back(temp);
    }
    
    for(int i = level_num - 1 ; i > 0 ; i--) {
        int level_back = levels[i];
        int level_front = levels[i - 1];
        
        if(level_front >= level_back) {
            level_front -= (level_front - level_back) + 1;
            answer += levels[i - 1] - level_front;
            levels[i - 1] = level_front;
        }
    }
    cout << answer;
    return 0;
}
