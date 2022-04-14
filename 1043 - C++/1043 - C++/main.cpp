#include <iostream>
using namespace std;

int people[51];
int knowPeople[51];
int party[51][51];
int N, M;

int main() {
    cin >> N >> M;
    int knowNum;
    cin >> knowNum;
    
    for (int i = 0 ; i < 51 ; i++) {
        people[i] = -1;
        for (int t = 0 ; t < 51 ; t++) {
            party[i][t] = -1;
        }
    }
    for (int i = 1 ; i <= N ; i++) {
        people[i] = 0;
    }
    for (int i = 1 ; i <= knowNum; i++) {
        int temp;
        scanf("%d", &temp);
        people[temp] = 1;
        knowPeople[i] = temp;
    }
    for (int i = 1 ; i <= M ; i++) {
        int temp;
        scanf("%d", &temp);
        for (int t = 1 ; t <= temp ; t++) {
            scanf("%d", &party[i][t]);
        }
    }
    for (int i = 1 ; i <= knowNum ; i++) {
        int temp = knowPeople[i];
        for (int x = 1 ; x <= M ; x++) {
            bool isKnow = false;
            for (int y = 1 ; ; y++) {
                if (party[x][y] == -1) break;
                if (party[x][y] == temp) isKnow = true;
            }
            if (isKnow) {
                for (int y = 1 ; ; y++) {
                    if (party[x][y] == -1) break;
                    if (people[party[x][y]] == 0) {
                        people[party[x][y]] = 1;
                        knowNum++;
                        knowPeople[knowNum] = party[x][y];
                    }
                }
            }
        }
    }
    int answer = 0;
    for (int i = 1 ; i <= M ; i++) {
        bool temp = true;
        for (int t = 1 ; ; t++) {
            if (party[i][t] == -1) break;
            if (people[party[i][t]] == 1) {
                temp = false;
                break;
            }
        }
        if (temp) answer++;
    }
    
    cout << answer;
    return 0;
}
