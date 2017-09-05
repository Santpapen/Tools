#include <fstream>
#include <iostream>
#include <string>

using namespace std;
ifstream infile;

int openFile(int n);

/* Global var */
string line;
int ini =0 ;


/* Init program */

int main()

{
char data[100];
string c = "run";
while (c == "run"){
        ini=openFile(ini);
}
/*infile.close();*/
return 0;
}


int openFile(int n) {
infile.open("dest.txt");
int numLine = 0;
if (infile.is_open()){
        while (getline (infile,line) )
        {
                numLine =numLine +1;
                if(n < numLine){
                cout << line << endl;
                }
        }

        infile.close();
}
return numLine;
}
