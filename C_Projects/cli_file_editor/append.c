#include "operations.h"

Status Append(const char* file_name, const char* input)
{
	FILE* fp = fopen(file_name, "a");
	if(fp == NULL)
	{
		printf("Error opening %s", file_name);
		return FILE_ERROR;
	}
	fprintf(fp, "%s\n", input);
	fclose(fp);
	return FILE_OK;
}
