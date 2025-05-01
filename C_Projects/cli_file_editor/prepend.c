#include <stdlib.h>
#include <string.h>
#include "operations.h"

Status Prepend(const char* file_name, const char* input)
{
	char* new_line;
	char* final;
	char* tmp_buf;
	size_t file_size;
	FILE* fp = fopen(file_name, "r");

	if(fp == NULL)
	{
		printf("Error opening %s", file_name);
		return FILE_ERROR;
	}

	new_line = (char*)(input + 1);
	fseek(fp, 0, SEEK_END);
	file_size = ftell(fp);
	rewind(fp);

	tmp_buf = malloc(file_size + 1);
	if(tmp_buf == NULL)
	{
		printf("Failed to allocate memory");
		fclose(fp);
		return MEMORY_FAIL;
	}

	fread(tmp_buf, sizeof(char), file_size, fp);
	tmp_buf[file_size] = '\0';
	final = malloc(strlen(new_line) + file_size + 2);

	if(final == NULL)
	{
		printf("Failed to allocate memory");
		free(tmp_buf);
		fclose(fp);
		return MEMORY_FAIL;
		}

	strcpy(final, new_line);
	strcat(final, "\n");
	strcat(final, tmp_buf);
	fclose(fp);

	fp = fopen(file_name, "w");
	if(fp == NULL)
	{
		printf("Error opening %s", file_name);
		return FILE_ERROR;
	}
	fputs(final, fp);
	fclose(fp);

	free(tmp_buf);
	free(final);

	return FILE_OK;
}
