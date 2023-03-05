#include <iostream>
#include <map>
using namespace std;

int main() {
    
    int n, idx = 0;
    int arr[1000001];
    map<int, int> temp;
    scanf("%d", &n);
    
    for (int i = 0 ; i < n ; i++) {
        scanf("%d", &arr[i]);
        if (temp.find(arr[i]) == temp.end()) {
            temp.insert({arr[i], 0});
        }
    }
    map<int, int>::iterator s;
    
    for (s = temp.begin(); s != temp.end() ; s++) {
        s->second = idx;
        idx++;
    }
    
    for (int i = 0 ; i < n ; i++) {
        cout << temp[arr[i]] << ' ';
    }
    return 0;
}
