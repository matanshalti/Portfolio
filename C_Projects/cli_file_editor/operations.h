#ifndef OPERATIONS_H
#define OPERATIONS_H

#include <stdio.h>

typedef enum FileStatus {
	FILE_OK,
	FILE_NOT_FOUND,
	FILE_ERROR,
	FILE_EXIT,
	FILE_DELETED,
	MEMORY_FAIL
} Status;

Status Append(const char* file_name, const char* input);
Status Prepend(const char* file_name, const char* input);
Status Count(const char* file_name, const char* input);
Status Remove(const char* file_name, const char* input);
Status Exit(const char* file_name, const char* input);

#endif

