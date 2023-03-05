#include <iostream>
#include <string>
#include <map>
using namespace std;

int main() {
    cin.tie(NULL);
    cout.tie(NULL);
    ios::sync_with_stdio(false);
    
    int N, M;
    cin >> N >> M;
    string temp1, temp2;
    map<string, string> pass;
    
    for (int i = 0 ; i < N ; i++) {
        cin >> temp1 >> temp2;
        pass.insert({temp1, temp2});
    }
    
    for (int i = 0 ; i < M ; i++) {
        cin >> temp1;
        cout << pass[temp1] << '\n';
    }
    return 0;
}
