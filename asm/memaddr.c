#include <stdio.h>

int string_length(char* sl) {
	// count stringlength
	int cntr=0;
	int i=0;
	while(sl[i]!='\0'){
		// debug print of string:
		printf("%c:%x\n",sl[i],&sl[i]);
		i++;
		cntr++;
	}	
	return cntr;
}

int main()
{
	int var1 = 10;
	char* string = "string";
	char symbol = 'a';
	printf("%d\n%x\n",var1,&var1);
	printf("%s\n%x\n",string,&string);
	printf("stringlength:%d\n",string_length(string));
	printf("%c\n%x\n",symbol,&symbol);
	return(0);
}
