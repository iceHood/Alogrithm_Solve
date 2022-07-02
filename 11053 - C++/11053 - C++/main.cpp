#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int arr[1005];
int dp[1005];
int N;
int result = 0;

int main(){

    cin >> N;

    for(int i = 1 ; i <= N ; i++) scanf("%d",&arr[i]);

    for(int i = 1 ; i <= N ; i++){
        for(int t = 0 ; t < i ; t++){
            if(arr[i] > arr[t] && dp[i] <= dp[t]){
                dp[i] = dp[t] + 1;
                if(dp[i] > result) result = dp[i];
            }
        }
    }

    cout << result;

    return 0;
}
