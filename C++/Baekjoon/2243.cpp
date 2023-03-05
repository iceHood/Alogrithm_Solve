#include <iostream>
#include <vector>
using namespace std;
typedef long long ll;

int N;
vector<ll> arr;
vector<ll> tree;

//update
void update() {
    
}

//get sum
ll get_delicious(int left, int right, int target) {
    if(left == right) tree[target];
}



int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    cin >> N;
    arr.assign(N, 0);
    tree.assign(N * 4, 0);
    
    return 0;
}
