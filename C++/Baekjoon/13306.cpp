#include <iostream>
#include <vector>
#include <stack>
using namespace std;

pair<int, bool> graph[200001];
stack<pair<int, pair<int, int>>> todo;

bool check(int first, int second) {
    pair<int, bool> temp = graph[first];
    int first_parent = first;
    int second_parent = second;
    while (temp.second) {
        first_parent = temp.first;
        temp = graph[temp.first];
    }
    
    temp = graph[second];
    while (temp.second) {
        second_parent = temp.first;
        temp = graph[temp.first];
    }
    
    if (first_parent == second_parent) return true;
    else return false;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    int N, Q;
    cin >> N >> Q;
    graph[1] = {1, false};
    for(int i = 1 ; i <= N - 1 ; i++) {
        int temp;
        cin >> temp;
        graph[i+1] = {temp, false};
    }
    
    for(int i = 0 ; i < N - 1 + Q ; i++) {
        int ctrl;
        cin >> ctrl;
        if (ctrl == 0) {
            int temp;
            cin >> temp;
            todo.push({0, {temp, 0}});
        } else {
            pair<int, int> temp;
            cin >> temp.first >> temp.second;
            todo.push({1, temp});
        }
    }
    
    vector<string> answers;
    while (!todo.empty()) {
        pair<int, pair<int, int>> task;
        task = todo.top();
        todo.pop();
        if (task.first == 0) {
            graph[task.second.first].second = true;
        } else {
            if(check(task.second.first, task.second.second)) answers.push_back("YES");
            else answers.push_back("NO");
        }
    }
    
    for(int i = answers.size() - 1 ; i > -1 ; i--) cout << answers[i] << '\n';
    return 0;
}
