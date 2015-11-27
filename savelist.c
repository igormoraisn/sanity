
#include <stdio.h>
#include <stdlib.h>
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
        printf("\n Node creation failed \n");
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
        printf("\n Adding node to end of list with value [%d]\n",val);

    struct test_struct *ptr = (struct test_struct*)malloc(sizeof(struct test_struct));
    if(NULL == ptr)
    {
        printf("\n Node creation failed \n");
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

    printf("\n Searching the list for value [%s] \n",erro);

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

    printf("\n -------Printing list Start------- \n");
    while(ptr != NULL)
    {
        printf("\n [%d %s] \n",ptr->val, ptr->error);
        ptr = ptr->next;
    }
    printf("\n -------Printing list End------- \n");

    return;
}
