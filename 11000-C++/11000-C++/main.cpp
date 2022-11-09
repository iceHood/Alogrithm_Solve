#include <iostream>
#include <queue>
#include <vector>
#include <map>
using namespace std;

map<int, priority_queue<int>> hi;

int main() {
    int N;
    cin >> N;
    for (int i = 0 ; i < N ; i++) {
        int temp1, temp2;
        cin >> temp1 >> temp2;
        hi[temp2].push(temp1);
    }
    
    
    return 0;
}

//priority_queue<pair<int, int>, vector<pair<int, int>>, greater<>> q1, q2;
//int main() {
//    int N;
//    cin >> N;
//    for (int i = 0 ; i < N ; i++) {
//        pair<int , int> temp;
//        cin >> temp.first >> temp.second;
//        q1.push(temp);
//    }
//    bool isOneTurn = true;
//    int answer = 0;
//    while (!q1.empty() || !q2.empty()) {
//        if (isOneTurn) {
//            pair<int , int> temp = q1.top();
//            q1.pop();
//            while (!q1.empty()) {
//                if (temp.second > q1.top().first) {
//                    q2.push(q1.top());
//                    q1.pop();
//                    continue;
//                }
//                temp = q1.top();
//                q1.pop();
//            }
//            isOneTurn = !isOneTurn;
//        } else {
//            pair<int , int> temp = q2.top();
//            q2.pop();
//            while (!q2.empty()) {
//                if (temp.second > q2.top().first) {
//                    q1.push(q2.top());
//                    q2.pop();
//                    continue;
//                }
//                temp = q2.top();
//                q2.pop();
//            }
//            isOneTurn = !isOneTurn;
//        }
//        answer++;
//    }
//    cout << answer;
//    return 0;
//}
