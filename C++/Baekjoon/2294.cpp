#include <iostream>
#include <vector>
#include <set>
#include <algorithm>
using namespace std;

int main() {
    int n, k;
    cin >> n >> k;
    
    vector<int> dp(k + 1, 10001);
    set<int> nanugi;
    for(int i = 0 ; i < n ; i++)  {
        int temp;
        cin >> temp;
        nanugi.insert(temp);
    }
    
    set<int>::iterator it = nanugi.begin();
    dp[0] = 0;
    while (it != nanugi.end()) {
        for(int i = *it ; i <= k ; i++) {
            dp[i] = min({dp[i], dp[i - *it] + 1});
        }
        it++;
    }
    cout << ((dp[k] != 10001) ? dp[k] : -1);
    return 0;
}
