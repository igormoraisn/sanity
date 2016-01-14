// Lista para armazenamento de erros

#include <string.h>

struct test_struct
{
    unsigned int val;
    char error[70];
    struct test_struct *next;
};

struct test_struct *head = NULL;
struct test_struct *curr = NULL;

struct test_struct* create_list(char *erro)
{
    struct test_struct *ptr = (struct test_struct*)malloc(sizeof(struct test_struct));
    if(NULL == ptr)
    {
        return NULL;
    }
    ptr->val = 0;
    strcpy(ptr->error, erro);
    ptr->next = NULL;

    head = curr = ptr;
    return ptr;
}

struct test_struct* add_to_list(int val, char *erro)
{

    struct test_struct *ptr = (struct test_struct*)malloc(sizeof(struct test_struct));
    if(NULL == ptr)
    {
        return NULL;
    }
    ptr->val = val;
    strcpy(ptr->error, erro);
    ptr->next = NULL;
    curr->next = ptr;
    curr = ptr;
    return ptr;
}

unsigned char *search_in_list(char *erro)
{
    struct test_struct *ptr = head;
    struct test_struct *tmp = NULL;


    while(ptr != NULL)
    {
        if(strstr(ptr->error, erro) != NULL)
        {
            break;
        }
        else
        {
            tmp = ptr;
            ptr = ptr->next;
        }
    }
	return ptr->error;
}


void print_list(void)
{
    struct test_struct *ptr = head;

    while(ptr != NULL)
    {
        ptr = ptr->next;
    }

    return;
}
