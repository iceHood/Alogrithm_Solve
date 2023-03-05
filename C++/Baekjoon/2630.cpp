#include <iostream>
#include <string>

int N, white = 0, blue = 0;
char **graph = new char*[N];

using namespace std;

char* giveInput() {
    char *temp = new char[N];
    string str;
    getline(cin, str);
    int tempC = 0;
    for (int i = 0; i < N * 2 - 1 ; i += 2 ) {
        temp[tempC++] = str[i];
    }
    return temp;
}

void solution(int y, int x, int n) {
    char start = graph[y][x];
    bool isDifferent = false;
    for (int i = y ; i < y + n && !isDifferent ; i++) {
        for (int t = x ; t < x + n ; t++) {
            if (graph[i][t] != start) {
                isDifferent = true;
                break;
            }
        }
    }
    
    if (isDifferent) {
        solution(y + n / 2, x, n / 2);
        solution(y + n / 2, x + n / 2, n / 2);
        solution(y, x, n / 2);
        solution(y, x + n / 2, n / 2);
    } else if(start == '1') {
        blue++;
    } else white++;
}

int main() {
    scanf("%d", &N);
    getchar();
    for (int i = 0; i < N; i++) {
        graph[i] = giveInput();
    }
    solution(0, 0, N);
    cout << white << "\n" << blue << endl;
}
