#include <stdio.h>
#include <string.h>
#include "handlers.h"

char buffer[BUFSIZ];
const char* file_name;

int main(int argc, char* argv[])
{
	size_t i;
	
	if (argc < 2)
	{
		printf("please enter a file name after %s\n", argv[0]);
		return 1;
	}
	
	file_name = argv[1];
	
	printf("to exit type: '-exit'\n");
	printf("to delete the file type: '-remove'\n");
	printf("to count lines type: '-count'\n");
	printf("to prepend add '<' before text\n");
	
	while(1)
	{
		printf("write something and press enter to append(-exit to quit):\n");
		fgets(buffer, sizeof(buffer), stdin);
		buffer[strcspn(buffer, "\n")] = '\0';
		
		for(i = 0; i < HANDLER_NUM; i++)
		{
			if(handler_array[i].compare == NULL || handler_array[i].compare(buffer, handler_array[i].command))
			{
				Status return_stat = handler_array[i].operation(file_name, buffer);
				
				if(return_stat == FILE_EXIT || return_stat == FILE_DELETED)
				{
					printf("Goodbye..\n");
					return 0;
				}
				break;
			}
		}
	}
	return 0;
}
