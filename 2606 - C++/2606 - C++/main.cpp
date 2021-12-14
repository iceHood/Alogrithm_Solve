#include <iostream>
#include <vector>

using namespace std;

vector<int> graph[101];
bool visit[101] = {false};

int dfs(int start) {
    visit[start] = true;
    int count = 0;
    for (int i = 0 ; i < graph[start].size(); i++) {
        int temp = graph[start][i];
        if (!visit[temp]) {
            count += dfs(temp);
            count++;
        }
    }
    return count;
}

int main() {
    int N = 0, order = 0;
    scanf("%d", &N);
    scanf("%d", &order);
    for(int i = 0 ; i < order ; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        graph[a].push_back(b);
        graph[b].push_back(a);
    }
    cout << dfs(1);
}
