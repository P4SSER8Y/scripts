#include <iostream>
using namespace std;

int main()
{
    char c;
    for (c='f';c<='z';c++)
        cout<<c<<"::\n\tif P"<<c<<"\n\t\treturn\n\tP"<<c<<"=1\n\tKeyCnt+=1\n\tKeyBit:=KeyBit|(1<<"<<(int)(c-'a')<<")\n\tgosub FnEvent\nreturn\n\n"<<c<<" UP::\n\tP"<<c<<"=0\n\tKeyCnt-=1\n\tgosub FnEvent\nreturn\n\n";
    return 0;
}
