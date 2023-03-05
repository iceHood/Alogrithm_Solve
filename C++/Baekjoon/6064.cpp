#include <iostream>

using namespace std;

int main() {
    int testCase;
    scanf("%d", &testCase);
    for (int i = 0 ; i < testCase ; i++) {
        int x, y, targetX, targetY;
        int nowX = 0, nowY = 0, cnt = 0;
        scanf("%d %d %d %d", &x, &y, &targetX, &targetY);
        int standard;
        int visit[40001] = { 0, };
        if (x < y) {
            standard = x;
            nowX = targetX;
            nowY = targetX;
            cnt = targetX;
            visit[nowY] += 1;
        } else {
            standard = y;
            nowX = targetY;
            nowY = targetY;
            cnt = targetY;
            visit[nowX] += 1;
        }
        while (true) {
            if (nowX == targetX && nowY == targetY) {
                cout << cnt << "\n";
                break;
            }
            if (x == standard) {
                nowY += standard;
                nowY %= y;
                if (nowY == 0) {
                    nowY = y;
                }
                cnt += standard;
                visit[nowY] += 1;
            } else {
                nowX += standard;
                nowX %= x;
                if (nowX == 0) {
                    nowX = x;
                }
                cnt += standard;
                visit[nowX] += 1;
            }
            if (visit[nowX] > 1 || visit[nowY] > 1) {
                cout << -1 << "\n";
                break;
            }
        }
    }
}
