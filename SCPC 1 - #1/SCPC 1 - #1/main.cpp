#include <iostream>
#include <cstdio>
#include <vector>
#include <algorithm>
#include <cstdlib>
using namespace std;

class Node {
public:
    Node* left;
    Node* right;
};

int Answer;

int main() {
    
    std::ios_base::sync_with_stdio(false);
    std::cout.tie(NULL);
    
    int T, test_case;
    cin >> T;
    for(test_case = 0 ; test_case < T; test_case++) {
        Answer = 0;
        int N, K;
        cin >> N >> K;
        
        
        
        cout << "Case #" << test_case+1 << endl;
        cout << Answer << endl;
    }
    return 0;
}
