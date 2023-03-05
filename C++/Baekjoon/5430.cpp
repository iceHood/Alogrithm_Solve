#include <iostream>
#include <vector>

using namespace std;

int main() {
    int testCase;
    scanf("%d", &testCase);
    cin.ignore();
    while (testCase--) {
        string ac, arr;
        int num, ft = 0, ed;
        vector<string> q;
        getline(cin, ac);
        scanf("%d", &num);
        cin.ignore();
        ed = num - 1;
        getline(cin, arr);
        string temp = "";
        for (int i = 0 ; i < arr.size() ; i++) {
            switch (arr[i]) {
                case '[':
                    break;
                case ']':
                    q.push_back(temp);
                    break;
                case ',':
                    q.push_back(temp);
                    temp = "";
                    break;
                default:
                    temp += arr[i];
                    break;
            }
        }
        bool isFirst = true;
        for (int i = 0 ; i < ac.size() ; i++) {
            if (ac[i] == 'R') {
                isFirst = !isFirst;
                continue;
            }
            if (isFirst) {
                ft++;
            } else ed--;
        }
        if (ed - ft < -1) {
            cout << "error" << "\n";
            continue;
        }
        cout << "[";
        
        if (isFirst) {
            for (int i = ft ; i <= ed ; i++) {
                if (i == ed) {
                    cout << q[i];
                } else cout << q[i] << ",";
            }
        } else {
            for (int i = ed ; ft <= i ; i--) {
                if (i == ft) {
                    cout << q[i];
                } else cout << q[i] << ",";
            }
        }
        cout << "]" << "\n";
    }
}
