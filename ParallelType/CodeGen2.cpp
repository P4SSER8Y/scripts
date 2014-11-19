#include <iostream>
#include <fstream>
using namespace std;

int main()
{
    ofstream fout;
    char c1,c2,c3;
    fout.open("output.txt",ios::out|ios::app);
    while (1)
    {
        cin>>c1>>c2>>c3;
        if ((('a'<=c1)&&(c1<='z'))&&(('a'<=c3)&&(c3<='z')))
        {
            if (('a'<=c2)&&(c2<='z'))
            {
                fout<<"\t\tif ((KeyBit&(1<<"<<(int)(c1-'a')<<"))&&(KeyBit&(1<<"<<(int)(c2-'a')<<")))\n\t\t{\n\t\t\tKeyOutput=%KeyOutput%"<<c3<<"\n\t\t\tKeyBit:=KeyBit&(2147483647^((1<<"<<(int)(c1-'a')<<")|(1<<"<<(int)(c2-'a')<<")))\n\t\t}\n";
                cout<<"\t\tif ((KeyBit&(1<<"<<(int)(c1-'a')<<"))&&(KeyBit&(1<<"<<(int)(c2-'a')<<")))\n\t\t{\n\t\t\tKeyOutput=%KeyOutput%"<<c3<<"\n\t\t\tKeyBit:=KeyBit&(2147483647^((1<<"<<(int)(c1-'a')<<")|(1<<"<<(int)(c2-'a')<<")))\n\t\t}\n";
            }else{
                cout<<"\t\tif (KeyBit&(1<<"<<(int)(c1-'a')<<"))\n\t\t{\n\t\t\tKeyOutput=%KeyOutput%"<<c3<<"\n\t\t\tKeyBit:=KeyBit&(2147483647^(1<<"<<(int)(c1-'a')<<"))\n\t\t}\n";
                fout<<"\t\tif (KeyBit&(1<<"<<(int)(c1-'a')<<"))\n\t\t{\n\t\t\tKeyOutput=%KeyOutput%"<<c3<<"\n\t\t\tKeyBit:=KeyBit&(2147483647^(1<<"<<(int)(c1-'a')<<"))\n\t\t}\n";
            }
        }else{
            break;
        }
    }
    fout.close();
    return 0;
}
