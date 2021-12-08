/* #include <iostream>

using namespace std;

typedef struct heap {
  int arr[100001];
  int size;
} heap;

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void insertHeap(heap* hp, int data) {
  int x = ++hp->size;

  while((x != 1) && (data < hp->arr[x/2])) {
    hp->arr[x] = hp->arr[x/2];
    x /= 2;
  }
  hp->arr[x] = data;
}

int deleteHeap(heap* hp) {
  if(hp->size == 0) return 0;
  int out = hp->arr[1];
  hp->arr[1] = hp->arr[hp->size--];
  int old = 1;
  int young;

  while(true) {
    young = old * 2;
    if(young + 1 <= hp->size && hp->arr[young] > hp->arr[young + 1]) young++;
    if(young > hp->size || hp->arr[young] > hp->arr[old]) break;
    swap(&hp->arr[old], &hp->arr[young]);
    old = young;
  }

  return out;
}


int main() {
  heap hp;
  hp.size = 0;
  int olderNum = 0;
  int command = 0;
  cin >> olderNum;
  while(olderNum--) {
    cin >> command;
    switch (command) {
        case 0:
            cout << deleteHeap(&hp) << "\n";
            break;
        default:
            insertHeap(&hp, command);
    }
  }
}
*/

#include <iostream>
#include <queue>

using namespace std;

int main() {
    priority_queue<int, vector<int>, greater<int>> q;
    int orderNum = 0;
    int command = 0;
    scanf("%d", &orderNum);
    while(orderNum--) {
        scanf("%d", &command);
        switch (command) {
            case 0:
                if (q.empty()) {
                    cout << "0" << "\n";
                } else {
                    cout << q.top() << "\n";
                    q.pop();
                }
                break;
            default:
                q.push(command);
                break;
        }
    }
}

