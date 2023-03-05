#include <iostream>
#include <vector>
using namespace std;

int main() {
    int testcase = 0;
    cin >> testcase;
    while (testcase--) {
        int N = 0;
        vector<pair<int, int>> candinate;
        cin >> N;
        int filter_first = 0;
        int filter_second = 0;
        int bound = 123456789;
        for(int i = 0 ; i < N ; i++) {
            pair<int, int> temp;
            cin >> temp.first >> temp.second;
            filter_first = temp.second == 1 ? temp.first : filter_first;
            filter_second = temp.first == 1 ? temp.second : filter_second;
            if (temp.first == temp.second && bound > temp.first) bound = temp.first;
            candinate.push_back(temp);
        }
        for(int i = N - 1; i > -1 ; i--) {
            if (candinate[i].first > filter_first || candinate[i].second > filter_second || (candinate[i].first > bound && candinate[i].second > bound)) {
                N--;
            }
        }
        cout << N << '\n';
    }
    return 0;
}
