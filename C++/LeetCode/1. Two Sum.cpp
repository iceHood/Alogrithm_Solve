#include <iostream>
#include <vector>
#include <map>
using namespace std;

// n^2 보다 시간을 적게하시오!
// idea) target = x + y -> y = target - x 로 구할 수 있음
// key - value 를 통해서 x를 넣으면 y가 나오는 dictionary(map) 을 만들자
// 그리고 y가 dictionary 안에 존재하는지 체크

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> m;
        vector<int> answer;
        
        // map 작성
        for(int i = 0 ; i < nums.size() ; i++) {
            int key = nums[i];
            int value = target - key;
            if(m.find(value) != m.end()) {
                answer.push_back(m[value]);
                answer.push_back(i);
                return answer;
            }
            m.insert({key, i});
        }
        return answer;
    }
};

int main() {
    vector<int> nums;
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(3);
//    nums.push_back(15);
    int target = 6;
    
    Solution a;
    nums = a.twoSum(nums, target);
    printf("[%d, %d]", nums[0], nums[1]);
    return 0;
}
