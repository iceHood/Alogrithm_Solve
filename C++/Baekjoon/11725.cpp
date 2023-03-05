#include <iostream>
#include <vector>
using namespace std;

vector<int> graph[100001];
int parent[100001];
void dfs(int current) {
    for(auto& temp: graph[current]) {
        if(parent[current] != temp) {
            parent[temp] = current;
            dfs(temp);
        }
    }
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    int N;
    cin >> N;
    for(int i = 1 ; i < N ; i++) {
        pair<int, int> temp;
        cin >> temp.first >> temp.second;
        graph[temp.first].push_back(temp.second);
        graph[temp.second].push_back(temp.first);
    }
    
    dfs(1);
    
    for(int i = 2; i <= N ; i++) {
        cout << parent[i] << '\n';
    }
    return 0;
}
