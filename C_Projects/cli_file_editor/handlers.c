#include <string.h>
#include "handlers.h"

int Compare(const char* input, const char* command)
{
	if(strcmp(command, "<") == 0)
		return (input[0] == command[0]);
	return (strcmp(input, command) == 0);
}

Handler handler_array[] = {
	{"-remove", Compare, Remove},
	{"-count", Compare, Count},
	{"-exit", Compare, Exit},
	{"<", Compare, Prepend},
	{NULL, NULL, Append}
};

const size_t HANDLER_NUM = sizeof(handler_array) / sizeof(handler_array[0]);
