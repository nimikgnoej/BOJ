#include <iostream>
using namespace std;

int main()
{
  int T;
  cin>>T;
  while(T--)
  {
    int N,M;
    cin>>N>>M;

    long long ans=1;
      
    int r=1;
    for(int j=M;j>M-N;j--)
    {
      ans *= j;
      ans /= r++;
    }
    cout<<ans<<endl;
  }
}