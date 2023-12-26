#include <iostream>
#include <queue>
#include <stack>
#include <vector>
#include <algorithm>
#include <climits>
#include <cstring>
#include <string>
#include <set>
#include <cmath>
#include <unordered_set>
#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

using namespace std;
typedef long long ll;
typedef unsigned long long ull;
typedef unsigned int ui;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

char checking[1001];

class Trie {
private:
    class Node {
    public:
        char value;
        Node* children[26];
        bool isWord;
        int length;
        
        Node(char val) : value(val), isWord(false), length(0) {
            for (int i = 0; i < 26; ++i) {
                children[i] = nullptr;
            }
        }
        
    };
    
    Node* root;
    
public:
    Trie() : root(new Node('*')) {}
    
    void insert(const std::string& word) {
        Node* node = root;
        for (char ch : word) {
            int idx = ch - 'a';
            if (node->children[idx]) {
                node = node->children[idx];
            } else {
                Node* nextNode = new Node(ch);
                node->children[idx] = nextNode;
                nextNode->length = node->length + 1;
                node = nextNode;
            }
        }
        node->isWord = true;
    }
    
    Node* findLast(const std::string& word) {
        Node* node = root;
        for (char ch : word) {
            int idx = ch - 'a';
            
            checking[node->length] = node->isWord ? 1 : 0;
            
            if (node->children[idx]) {
                node = node->children[idx];
            } else {
                return node;
            }
        }
        checking[node->length] = node->isWord ? 1 : 0;
        return node;
    }
    
    int search(const std::string& word) {
        return findLast(word)->length;
    }
    
    bool startsWith(const std::string& prefix) {
        return findLast(prefix) != nullptr;
    }
};

class FileIO {
public:
    int readInt() {
        int num;
        std::cin >> num;
        return num;
    }
    
    std::string readString() {
        std::string str;
        std::cin >> str;
        return str;
    }
};

void solve() {
    Trie cTrie;
    std::unordered_set<std::string> nickNames;
    
    FileIO readHelper;
    int C, N, Q;
    std::string result = "";
    
    C = readHelper.readInt();
    N = readHelper.readInt();
    
    for (int i = 0; i < C; ++i) {
        cTrie.insert(readHelper.readString());
    }
    
    for (int i = 0; i < N; ++i) {
        nickNames.insert(readHelper.readString());
    }
    
    Q = readHelper.readInt();
    
    for (int i = 0; i < Q; ++i) {
        std::string teamName = readHelper.readString();
        int itsColor = cTrie.search(teamName);
//        cout << teamName << endl;
        int j = 0;
        for (; j <= itsColor ; j++) {
//            cout << itsColor << ": " << j << " " << int(checking[j]) << " " << teamName.substr(j) << " " <<  endl;
            if (checking[j] && (nickNames.find(teamName.substr(j)) != nickNames.end())) {
                result += "Yes\n";
                break;
            }
        }
        
        if (j > itsColor) {
            result += "No\n";
        }
    }
    
    std::cout << result;
}

int main() {
    fast_io
    solve();
    return 0;
}
