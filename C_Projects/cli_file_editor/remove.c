#include "operations.h"

Status Remove(const char* file_name, const char* input)
{
	FILE* fp = fopen(file_name, "r+");
	
	(void) input;
	
	if(fp == NULL)
	{
		printf("Error opening %s", file_name);
		return FILE_ERROR;
	}
	
	fclose(fp);
	remove(file_name);
	
	printf("file removed\n");
	return FILE_DELETED;
}
