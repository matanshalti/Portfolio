#include "operations.h"

Status Count(const char* file_name, const char* input)
{
	char ch;
	int count = 0;

	FILE* fp = fopen(file_name, "r");
	
	(void) input;
	
	if(fp == NULL)
	{
		printf("Error opening %s", file_name);
		return FILE_ERROR;
	}
	
	while ((ch = getc(fp)) != EOF)
	{
		if(ch == '\n') count++;
	}
	
	fclose(fp);
	printf("there are %d lines\n", count);
	return FILE_OK;
}
