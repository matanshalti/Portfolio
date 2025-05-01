#ifndef HANDLERS_H
#define HANDLERS_H

#include "operations.h"

typedef struct Handler {
	const char* command;
 	int (*compare)(const char* input, const char* command);
	Status (*operation)(const char* file_name, const char* input);
} Handler;

extern Handler handler_array[];
extern const size_t HANDLER_NUM;

int Compare(const char* input, const char* command);

#endif
