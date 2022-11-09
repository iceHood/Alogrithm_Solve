#include <iostream>
#include <string>
#include <cmath>
using namespace std;

int main() {
    int testcase;
    cin >> testcase;
    while (testcase--) {
        int occello_num;
        string my_occello;
        string object_occello;
        cin >> occello_num >> my_occello >> object_occello;
        
        int my_white_num = 0, my_black_num = 0;
        int object_white_num = 0, object_black_num = 0;
        int diff_num = 0;
        for(int i = 0 ; i < occello_num ; i++) {
            if (my_occello[i] == 'W') my_white_num++;
            if (object_occello[i] == 'W') object_white_num++;
            if (my_occello[i] != object_occello[i]) diff_num++;
        }
        my_black_num = occello_num - my_white_num;
        object_black_num = occello_num - object_white_num;
        
        int answer = 0;
        answer += abs(my_white_num - object_white_num);
        diff_num -= answer;
        answer += diff_num / 2;
        cout << answer << '\n';
    }
    return 0;
}
