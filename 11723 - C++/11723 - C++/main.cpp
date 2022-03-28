#include <iostream>
#include <cstring>

using namespace std;

int s[21] = {0, };

void reInit(int x) {
    for (int i = 0 ; i < 21 ; i++) {
        s[i] = x;
    }
}

int main() {
    int M;
    cin >> M;
    char cmd[7];
    int num;
    
    while (M--) {
        scanf("%s %d", cmd, &num);
        if (!strcmp(cmd, "add")) {
            s[num] = 1;
        } else if (!strcmp(cmd, "remove")) {
            s[num] = 0;
        } else if (!strcmp(cmd, "check")) {
            if (s[num] == 0) {
                cout << 0 << "\n";
            } else cout << 1 << "\n";
        } else if (!strcmp(cmd, "toggle")) {
            if (s[num] == 0) {
                s[num] = 1;
            } else s[num] = 0;
        } else if (!strcmp(cmd, "all")) {
            reInit(1);
        } else reInit(0);
    }
    return 0;
}
