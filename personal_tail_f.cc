#include <fstream>
#include <stdio.h>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;
ifstream infile;

int openFile(int n);

/* Global var */
string line;
int ini =0 ;

/* Init program */

int main()

{
string c = "run"; // Iniciador del programa
while (c == "run"){ 
	ini=openFile(ini);
}
return 0;
}


int openFile(int n) {
infile.open("pruebasDHCP"); /* Fichero a filtrar */
int numLine = 0; /* Iniciador de contador */
char delimiter[100]; //Variable 
if (infile.is_open()){
	while (getline (infile,line) )
	{
		numLine =numLine +1; 
		if(n < numLine){
			istringstream iss(line);
			do 
			{
				string subs; //Split del line
				iss >> subs;  
				for (int i=0;i<subs.length();i++){
					delimiter[i]=subs[i]; // Pasa la string a char
				}
				if (strcmp(delimiter,"(DHCPREQUEST)")==0){ /* Filtrado por palabra */
				cout << "Substrings: " << line << endl; // Imprime la linea 
				}
				memset(delimiter,0,100); /* RESETEO */	
			}while (iss);
		}
	}
	
	infile.close();
}
return numLine;
}
