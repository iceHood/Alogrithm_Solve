#include <string>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;

int solution(vector<vector<int>> triangle) {
    int answer = 0;
    if (triangle.size() == 1) return triangle[0][0];
    for(int i = 1 ; i < triangle.size() ; i++) {
        for(int j = 0 ; j < triangle[i].size() ; j++) {
            if (j == 0) {
                triangle[i][j] += triangle[i-1][0];
            } else if (j == triangle[i].size() - 1) {
                triangle[i][j] += triangle[i-1][j-1];
            } else {
                triangle[i][j] += max(triangle[i-1][j-1], triangle[i-1][j]);
            }
        }
    }
    
    for(auto num : triangle[triangle.size()-1]) {
        answer = max(answer, num);
    }
    
    return answer;
}
