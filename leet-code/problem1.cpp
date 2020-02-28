#include <iostream>
#include <vector>
#include <algorithm>
using std::vector;
using std::cout;
using std::endl;


void print_v(vector<int> a) {
  for (auto i : a)
    cout << i << " ";
  cout << endl;
}

void print_vec(vector<int> a) {
  std::for_each(a.begin(), a.end(), [](int i) {
      cout << i << " ";
    });
  cout << endl;
}

class Solution {
public:
    static vector<int> twoSum(vector<int>& nums, int target) {
      vector<int> res;
      int a_i=0, b_i=0;
      for (auto a : nums) {
	b_i = 0;
	for (auto b : nums){
	  if (a_i == b_i)
	    continue;
	  if (a + b == target) {
	    res = {a_i,b_i};
	    return res;
	  }
	  b_i++;
	}
	a_i++;
      }
      return res;
    }
};

int main()
{
  vector<int> A{3, 2, 4, 6, 5, 9};
  auto target = 6;


  vector<int> B = Solution::twoSum(A, target);

  print_v(B);

  cout << "Fin" << endl;
  return 0;
}


/* Given an array of integers, return indices of the two numbers such that they
 add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not
 use the same element twice. */
