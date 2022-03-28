#include <iostream>

using namespace std;

int graph[100][100];
int num;

void sol() {
    for (int k = 0 ; k < num ; k++) {
        for (int i = 0 ; i < num ; i++) {
            for (int t = 0 ; t < num ; t++) {
                if (graph[i][k] && graph[k][t]) {
                    graph[i][t] = 1;
                }
            }
        }
    }
}

int main() {
    cin >> num;
    for (int i = 0 ; i < num ; i++) {
        for (int t = 0 ; t < num ; t++) cin >> graph[i][t];
    }
    
    sol();
    
    for (int i = 0 ; i < num ; i++) {
        for (int t = 0 ; t < num ; t++) {
            cout << graph[i][t] << " ";
        }
        cout << "\n";
    }
    
    return 0;
}
