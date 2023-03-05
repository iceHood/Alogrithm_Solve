#include <iostream>
#include <vector>
using namespace std;

vector<pair<int, int>> v[100001];
int visited[100001];
int num, mD, mN;

void clear() {
    for (int i = 0 ; i <= num ; i++) {
        visited[i] = false;
    }
}

void dfs(int start, int count) {
    visited[start] = true;
    if (mD < count) {
        mD = count;
        mN = start;
    }
    for (int i = 0 ; i < v[start].size() ; i++) {
        pair<int, int> temp = v[start][i];
        if (!visited[temp.first]) {
            dfs(temp.first, count + temp.second);
        }
    }
    return;
}

int main() {
    cin >> num;
    for (int i = 1 ; i <= num ; i++) {
        int a;
        scanf("%d", &a);
        pair<int, int> temp;
        
        while (true) {
            scanf("%d", &temp.first);
            if (temp.first == -1) {
                break;
            }
            scanf("%d", &temp.second);
            v[a].push_back(temp);
        }
    }
    
    clear();
    dfs(1, 0);
    clear();
    dfs(mN, 0);
    cout << mD;
    return 0;
}
