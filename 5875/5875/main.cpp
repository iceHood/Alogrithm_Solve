#include <iostream>
#include <string>
using namespace std;

// 바꿀 수 있는 괄호와 아닌 괄호가 있다.
// 일반적으로 둘중 하나인 것들에서 하나를 바꾸면 한번에 차이가 2만큼 매꿔진다.
// 따라서 바꿀 때는 차이가 2 이상인지를 확인해야한다.
int main() {
    string gualHo;
    cin >> gualHo;
    int mutable_left = 0;
    int mutable_right = 0;
    int sum = 0;
    int result = 0;
    int length_gualHo = gualHo.length();
    for(int i = 0 ; i < length_gualHo ; i++) {
        if (gualHo[i] == '(') {
            mutable_left++;
            sum++;
        } else {
            mutable_right++;
            sum--;
        }
        if (sum < 2) { // 왼쪽 괄호와 오른쪽 괄호의 차이가 2 아래로 떨어졌다.
            // 이 경우 이 지점 아래에 있는 왼쪽 괄호는 바꿀 수 없게 된다.
            mutable_left = 0;
        }
        if (sum < 0) { // 음수가 되었다는 것은 오른쪽괄호가 더 많다는 뜻.
            // 실수는 한 번만 일어나므로 음수 기준 오른쪽은 올바른 괄호일 것임
            // 자기 이하에 있는 오른쪽 괄호들 개수만큼 바꿀 수 있음
            result = mutable_right;
            break;
        }
    }
    if(sum > 0) { // 결과, 왼쪽괄호가 더 많을 경우
        result = mutable_left;
    }
    cout << result;
    return 0;
}
