#include <iostream>
#include <string>

using namespace std;

void printNetPa(string str);

int main(int argc, char* argv[])
{
    string str = "";
    bool judge = false;

    while (cin >> str)
    {
        if (!judge)
        {
            cout << "gt_pa = '" << str << "'" << endl;
            judge = true;
        }
        else
        {
            cout << "im_pa = '" << str << "'" << endl;
            printNetPa(str);
            cout << "func_detect(im_pa, gt_pa, net_path, path_save);" << endl << endl << endl;
            judge = false;
        }
    }


    return 0;
}

void printNetPa(string str)
{
    string netpa = "";
    int judge = 2;

    int i;
    for (i = str.size() - 2;i != 0;i --)
    {

        if (str[i] == '/')
        {
            judge --;
        }

        if (judge < 2 && judge > -1)
        {
            netpa = str[i] + netpa;
        }
    }

    cout << "net_path = " << "'../network/" << netpa << "'" << endl;
    cout << "path_save = " << "'../detection/" << netpa << "'" << endl;
}
