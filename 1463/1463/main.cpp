#include <iostream>
#include <queue>
#include <vector>
using namespace std;
/*
queue<int> quty;
priority_queue<int, vector<int>, greater<int>> q;
vector<int> cycle(4);

void findAnswer(int x, int cnt, int t) {
  if(x == 1) {
    q.push(cnt);
    return;
  } else if (x <= 0) return;
  if (!(x % 3)) {
    quty.push(x / 3);
    cycle[t]++;
  }
  if (!(x % 2)) {
    quty.push(x / 2);
    cycle[t]++;
  }
  quty.push(x - 1);
  cycle[t]++;
}

int main() {
  int n = 0;
  cin >> n;
  findAnswer(n, 0, 1);
  int takeTime = 1;
  while (!quty.empty()) {
    int temp = quty.front();
    quty.pop();
    if(cycle[takeTime] == 0) {
      cycle.push_back(0);
      takeTime++;
    }
    findAnswer(temp, takeTime, takeTime + 1);
    cycle[takeTime]--;
  }
  cout << q.top();
}
*/

int main() {
  int n = 0;
  cin >> n;
  int cnt = 0;
  queue<int> q;
  q.push(n);
  vector<int> ahffk(1000);
  ahffk[cnt] = 1;
  while (true) {
    int temp = q.front();
    q.pop();
    if(ahffk[cnt] == 0) {
      cnt++;
    }
    if(temp == 1) {
      cout << cnt;
      break;
    }
    if(!(temp % 2)) {
      if(q.back() == 1) {
        cout << cnt + 1;
        break;
      }
      q.push(temp / 2);
      ahffk[cnt + 1]++;
    }
    if(!(temp % 3)) {
      if(q.back() == 1) {
        cout << cnt + 1;
        break;
      }
      q.push(temp / 3);
      ahffk[cnt + 1]++;
    }
    if(q.back() == 1) {
      cout << cnt + 1;
      break;
    }
    q.push(temp - 1);
    ahffk[cnt + 1]++;
    ahffk[cnt]--;
  }
}

/*
int main() {
  int n = 0;
  cin >> n;
  int cnt = 0;
  while (n != 1) {
    if(!(n % 3)) {
      n /= 3;
    } else if(!(n % 2)) {
      n /= 2;
    } else {
      n--;
    }
    cout << n << " " << cnt << endl;
    cnt++;
  }
  cout << cnt;
}*/
