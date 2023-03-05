#include <iostream>
#include <string>
#include <stack>
using namespace std;

string read;
char answer[100];
stack<char> op;

int main() {
    cin >> read;
    int enterLength = (int)read.length();
    int idx = 0;
    for (int i = 0 ; i < enterLength ; i++) {
        char temp = read[i];
        if (temp == '+' || temp == '-' || temp == '*' || temp == '/') {
            if (op.empty()) {
                op.push(temp);
                continue;
            }
            
            char t = op.top();
            if (((temp == '+' || temp == '-') && (t == '+' || t == '-')) || ((temp == '*' || temp == '/') && (t == '*' || t == '/'))) {
                answer[idx++] = t;
                op.pop();
            } else if ((temp == '+' || temp == '-') && (t == '*' || t == '/')) {
                while (!op.empty() && op.top() != '(') {
                    answer[idx++] = op.top();
                    op.pop();
                }
            }
            op.push(temp);
            if (op.top() == '(') {
                op.pop();
            }
            continue;
        }
        if (temp == ')') {
            while (!op.empty() && op.top() != '(') {
                answer[idx++] = op.top();
                op.pop();
            }
            if (op.top() == '(') {
                op.pop();
            }
            continue;
        } else if (temp == '(') {
            op.push(temp);
            continue;
        }
        answer[idx++] = temp;
    }
    while (!op.empty() && op.top() != '(') {
        answer[idx++] = op.top();
        op.pop();
    }
    for (int i = 0 ; i < idx; i++) {
        printf("%c", answer[i]);
    }
}

/*
string read;
char answer[100];
stack<char> op[100];

int main() {
    cin >> read;
    int enterLength = (int)read.length();
    int idx = 0;
    char before[100];
    int closet = 0;
    int minusLength = 0;
    for (int i = 0; i < enterLength ; i++) {
        char temp = read[i];
        if (temp == '+' || temp == '-' || temp == '*' || temp == '/') {
            if ((before[closet] == '*' || before[closet] == '/') && (temp == '+' || temp == '-')) {
                while (!op[closet].empty()) {
                    answer[idx++] = op[closet].top();
                    op[closet].pop();
                }
            }
            op[closet].push(temp);
            before[closet] = temp;
            continue;
        }
        if (temp == '(') {
            closet++;
            minusLength += 2;
            continue;
        } else if (temp == ')') {
            while (!op[closet].empty()) {
                answer[idx++] = op[closet].top();
                op[closet].pop();
            }
            closet--;
            continue;
        }
        answer[idx++] = temp;
    }
    if (closet == 0) {
        while (!op[closet].empty()) {
            answer[idx++] = op[closet].top();
            op[closet].pop();
        }
    }
    enterLength -= minusLength;
    for (int i = 0 ; i < enterLength; i++) {
        printf("%c", answer[i]);
    }
    return 0;
}
 */
//ABCD+E-*FG+/+
//ABCDE-+FG+/*+
//ABCDE-+*FG+/+
