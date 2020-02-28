#include <iostream>
#include <cmath>
using namespace std;


int main()
{
  int *value = new int[1001];
  for (int i=0; i<1002; ++i)
    value[i] = 0;
  double c=0;

  
  for (int a=0; a<500; ++a)
  {
    for (int b=0; b<500; ++b)
    {
      c = sqrt(pow((double)a,2)+pow((double)b,2));
      if (c == floor(c))
	value[a+b+(int)c] += 1;
    }
  }


  int max = 0, max_i;
  for (int i=0; i<1002; ++i)
    if (max < value[i])
    {
      max   = value[i];
      max_i = i;
      cout << " i is " << i << endl;
    }
      

  cout << "Max is " << max << endl;
  cout << "Max_i is " << max_i << endl;  
  cout << "Fin" << endl;
  return 0;
}
