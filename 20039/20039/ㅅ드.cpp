#include <iostream>
#include <vector>
#include <string>
using namespace std;

const int MAX = 1e4+1;
int dp[MAX][3];
string S, T, S_without_picks, S_picks;
int length_OX, pick_left, pick_right;

int find(int without_idx, int target_idx, int use_idx) {
    int& result = dp[target_idx][use_idx];
    
    if (result != -1) return result;
    
    if(target_idx == length_OX) {
        if (use_idx == 2) return result = 1;
        else return result = 0;
    }
    
    result = 0;
    
    if (use_idx < 2 && T[target_idx] == S_picks[use_idx])
        result = find(without_idx, target_idx + 1, use_idx + 1);
    
    if (S_without_picks[without_idx] == T[target_idx] && without_idx < length_OX - 2)
        result = find(without_idx + 1, target_idx + 1, use_idx);
    
    return result;
}


int main1() {
    cin >> length_OX >> S >> T >> pick_left >> pick_right;
    S_picks += S[pick_left];
    S_picks += S[pick_right];
    for(int i = 0 ; i < length_OX ; i++) {
        S_without_picks = (i == pick_left || i == pick_right) ? S_without_picks : S_without_picks + S[i];
    }
    memset(dp, -1, sizeof(dp));
    
    if(find(0, 0, 0)) cout << "YES";
    else cout << "NO";
    
    return 0;
}
