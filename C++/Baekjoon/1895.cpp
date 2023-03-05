#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

typedef vector<int> vi;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    int R, C;
    cin >> R >> C;
    
    vector<vi> image;
    vector<vi> filter;
    for(int i = 0 ; i < R ; i++) {
        vi temp;
        for(int t = 0 ; t < C ; t++) {
            int temp_num;
            cin >> temp_num;
            temp.push_back(temp_num);
        }
        image.push_back(temp);
    }
    
    pair<int, int> move[9] = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 0}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
    for(int i = 1 ; i < R - 1 ; i++) {
        vi push_temp;
        for (int t = 1 ; t < C - 1 ; t++) {
            vi temp;
            for(int j = 0 ; j < 9 ; j++)
                temp.push_back(image[i + move[j].first][t + move[j].second]);
            sort(temp.begin(), temp.end());
            push_temp.push_back(temp[4]);
        }
        filter.push_back(push_temp);
    }
    
    int answer = 0;
    int T;
    cin >> T;
    for(int i = 0 ; i < R - 2 ; i++) {
        for (int t = 0 ; t < C - 2 ; t++) {
            answer += filter[i][t] >= T ? 1 : 0;
        }
    }
    cout << answer;
    return 0;
}
