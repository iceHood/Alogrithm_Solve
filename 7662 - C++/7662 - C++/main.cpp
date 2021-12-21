#include <iostream>
#include <set>

using namespace std;

int main() {
    int testCase;
    scanf("%d", &testCase);
    while (testCase--) {
        int mustEnter;
        multiset<int> q;
        scanf("%d", &mustEnter);
        cin.ignore();
        while (mustEnter--) {
            char order;
            int enterMember;
            scanf("%c %d", &order, &enterMember);
            cin.ignore();
            switch (order) {
                case 'I':
                    q.insert(enterMember);
                    break;
                case 'D':
                    if (!q.empty() && enterMember == -1) {
                        q.erase(q.begin());
                    } else if (!q.empty() && enterMember == 1) {
                        q.erase(--q.end());
                    }
                    break;
                default:
                    break;
            }
        }
        if (q.empty()) {
            cout << "EMPTY" << "\n";
        } else {
            cout << *(--q.end()) << " " << *q.begin() << "\n";
        }
    }
}
