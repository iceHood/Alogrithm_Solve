#include <iostream>
#include <vector>

void solve() {
    std::string T, P;
    std::getline(std::cin, T);
    std::getline(std::cin, P);

    auto findPattern = [](const std::string& pattern) -> std::vector<int> {
        std::vector<int> arr(pattern.size() + 1, 0);
        int i = -1;
        int j = 0;
        arr[j] = i;

        while (j < pattern.size()) {
            if (i == -1 || pattern[i] == pattern[j]) {
                ++j;
                ++i;
                arr[j] = i;
            } else {
                i = arr[i];
            }
        }
        return arr;
    };

    std::vector<int> pattern = findPattern(P);
    std::vector<int> pos;
    int i = 0;
    int j = 0;

    while (i < T.size()) {
        if (j == -1 || T[i] == P[j]) {
            ++i;
            ++j;
        } else {
            j = pattern[j];
        }

        if (j == P.size()) {
            pos.push_back(i - j + 1);
            j = pattern[j];
        }
    }

    std::cout << pos.size() << '\n';
    for (int p : pos) {
        std::cout << p << ' ';
    }
}

int main() {
    solve();
    return 0;
}
