#include <vector>
#include <iostream>
using namespace std;

class Solution {
public:
    void recursion(vector<int> num, int i, int j, vector<vector<int> > &res) {
        if (i == j-1) {
            res.push_back(num);
            return;
        }
        for (int k = i; k < j; k++) {
            if (i != k && num[i] == num[k]) continue;
            swap(num[i], num[k]);
            recursion(num, i+1, j, res);
        }
    }
    vector<vector<int> > permute(vector<int> &num) {
        sort(num.begin(), num.end());
        vector<vector<int> >res;
        recursion(num, 0, num.size(), res);
        return res;
    }
};

int main() {
    Solution *s = new Solution();
    vector<int> vec;
    vec.push_back(1);
    vec.push_back(2);
    vec.push_back(3);
            for (auto x: vec) {
                cout << x << endl;
        }
    s->permute(vec);
    return 0;
}