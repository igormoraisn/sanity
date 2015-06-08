/*	Universidade Federal de Sergipe
 * 	Igor Nascimento dos Santos
 * 	Gerência e Suporte a Sistemas - DCOMP
 *  	Teste de Sanidade com o Gcc
 */

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <float.h>
#include <limits.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h> 

/*	The library ctype.h declares several functions that are useful for testing and mapping characters
 *	Return 0 for false and 1 for true / Recieves a int
 */
unsigned int _ctype(FILE*output){
	char test;
	fprintf(output, "%u", isdigit('1'));
	fprintf(output, "%u", islower('A'));
	fprintf(output, "%u", isspace(' '));
	test = toupper('b');
	fprintf(output, "%u", isupper(test));
	return 0;
}

/*	The error code macros are defined in the header file errno.h. All of them expand into integer constant values. */
unsigned int _errno(FILE* output){
	char* path = "/etc/fstab";
    int val;
    val = access(path, F_OK);
    if (val == 0)
		fprintf (output, "%u", 1);
	else {
		if (errno == ENOENT)
			fprintf (output, "%d", 0);
		else{
			if (errno == EACCES)
				fprintf(output, "%u", 2);
		}
	} 
	return 1;
}

/*	The float.h header file of the C Standard Library contains a set of various platform-dependent constants 
 *  related to floating point values. These constants are proposed by ANSI C.
 */
unsigned int _float(FILE* output){
	float_t test;
	float teste;
	test = 1.22321331;
	teste = test;
	fprintf(output, "%f", teste);
	return 2;
}

/*	The limits.h header determines various properties of the various variable types. 
 * 	The macros defined in this header, limits the values of various variable types like char, int and long.
 */
unsigned int _limits(FILE* output){
	fprintf(output, "%d %d %d %d %d %d ", CHAR_BIT, SCHAR_MIN, 
	UCHAR_MAX, SHRT_MIN, INT_MAX, CHAR_MIN);
	return 3;
}

/*	The math.h header defines various mathematical functions and one macro. 
 * 	All the functions available in this library take double as an argument and return double as the result.
 */
unsigned int _math(FILE* output){
	fprintf(output, "%f%f%f%f", (exp2(10) + cos(90)),
	(atan(30) + tan(1.537475)),
	(hypot(13, 23)),
	(exp(5) - sqrt(255)));
	return 4;
}

/*	The stdlib.h header defines four variable types, several macros, 
 * 	and various functions for performing general functions.
 */
unsigned int _stdlib(FILE* output){
	srand(time(NULL));
	//printf("%d\n", rand()%99);
	//system("clear");
	fprintf(output, "%d%f%ld", atoi("103"), atof("985.3"), atol("12141312"));
	return 5;
}

/*	The string.h header defines one variable type, one macro, 
 * 	and various functions for manipulating arrays of characters.
 */
unsigned int _string(FILE* output){
	char str1[25], str2[6];
	int stra, strb;
	strcpy(str1,"Teste de Sanidade");
	strcpy(str2,"DCOMP");
	stra = strlen(str1);
	strb = strlen(str2);
	

	fprintf(output, "%u%u", stra, strb);
	if(strcmp(str1, str2) == 0)
		fprintf(output, "%s", "EQ");
	else
		fprintf(output, "%s", "NEQ");
	

	fprintf(output, "%s", strcat(str1, "DCOMP"));
	return 6;
}

int main() {
	FILE* output = fopen("gcc.txt", "a");
	fprintf(output, "%u\n", _ctype(output));
	fprintf(output, "%u\n", _errno(output));
	fprintf(output, "%u\n", _float(output));
	fprintf(output, "%u\n", _limits(output));
	fprintf(output, "%u\n", _math(output));
	fprintf(output, "%u\n", _stdlib(output));
	fprintf(output, "%u\n", _string(output));
	fclose(output);
return 0;
}

// NOTA: Pode-se adicionar mais bibliotecas, funções ou artifícios a serem testados
