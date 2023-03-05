#include <iostream>
#include <vector>
using namespace std;

typedef long long ll;
typedef pair<int, int> pii;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    int N, M;
    cin >> N >> M;
    vector<vector<int>> arr;
    
    for(int i = 0 ; i < N ; i++) {
        vector<int> temp;
        for(int t = 0 ; t < M ; t++) {
            int temp_num;
            cin >> temp_num;
            temp.push_back(temp_num);
        }
        arr.push_back(temp);
    }
    
    int testcase;
    vector<pair<pii, pii>> coordinates;
    cin >> testcase;
    for(int i = 0 ; i < testcase ; i++) {
        pair<pii, pii> temp;
        cin >> temp.first.first >> temp.first.second >> temp.second.first >> temp.second.second;
        coordinates.push_back(temp);
    }
    for(int j = 0; j < testcase ; j++) {
        ll answer = 0;
        for(int i = coordinates[j].first.first - 1 ; i < coordinates[j].second.first ; i++)
            for(int t = coordinates[j].first.second - 1 ; t < coordinates[j].second.second ; t++) answer += (ll)arr[i][t];
        cout << answer << '\n';
    }
    return 0;
}
