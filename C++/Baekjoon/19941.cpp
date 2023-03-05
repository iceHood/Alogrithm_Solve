#include <iostream>
#include <string>
using namespace std;
int main() {
    int length, range;
    string HPs;
    cin >> length >> range >> HPs;
    int answer = 0;
    for(int i = 0 ; i < length ; i++) {
        for(int t = i - range ; t <= i + range && HPs[i] == 'H' ; t++) {
            if(t < 0 || t > length - 1) continue;
            else {
                if (HPs[t] == 'P') {
                    HPs[t] = 'E';
                    answer++;
                    break;
                }
            }
        }
    }
    cout << answer;
    return 0;
}
