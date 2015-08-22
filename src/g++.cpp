/*  Universidade Federal de Sergipe
 *  Centro de Ciências Exatas e Tecnológicas
 *  Departamento de Computação
 *  Sanity
 */

#include <cstdio>
#include <iostream>
#include <string>
#include <fstream>
#include <cmath>

using namespace std;

class sanity{
	private:
		string name;
		int num;
		ofstream myfile;
	public:
		sanity(){
			this->myfile.open ("g++.txt");

		}
		~sanity(){
			this->myfile.close();
		}		
		void String(){
			this->name = "Teste de Sanidade";
			myfile << this->name;
		}
		void Math(){
			double graus, raio, base, expoente, x;
			graus = 45;
			raio = 2.543;
			base = 2;
			expoente = 5;
			x = pow (base, expoente);
			myfile << graus << sin(graus) << endl;
			myfile << graus << cos(graus) << endl;
			myfile << graus << tan(graus) << endl;
			myfile << base << expoente << x << endl;
			myfile << x << sqrt(x) << endl;
			myfile << x << log(x) << endl;
			myfile << x << log10(x) << endl;
			myfile << x << ceil(x) << endl;
			myfile << x << floor(x) << endl;
			myfile << raio;
			myfile << raio*2*M_PI;
			myfile << pow(raio,2)*M_PI <<endl;
		}
	
};

int main(){
	sanity teste;
	teste.String();
	teste.Math();
}
