/*	Componente que gera o icon view a partir dos logs de testes
 * 	Sanity 0.3
 */
 
#include "savelist.c"

enum
{
  COL_DISPLAY_NAME,
  COL_PIXBUF,
  NUM_COLS
};

char host_name[30], user_name[20];

void get_hostname() 
{
	FILE* fpa;
	fpa = popen("hostname", "r"); 
	fgets( host_name, sizeof host_name, fpa);
	pclose(fpa);
	host_name[(strlen(host_name))-1] = '\0';
}

void get_user() 
{
	FILE* fp;
	fp = popen("whoami", "r"); 
	fgets( user_name, sizeof user_name, fp);
	pclose(fp);
	user_name[(strlen(user_name))-1] = '\0';
}

/* Create the ListStore and fill it with required data */
GtkTreeModel *create_and_fill_model (void) 
{
	GtkListStore *list_store;
	GdkPixbuf *p1;
	GtkTreeIter iter;
	GError *err = NULL;
	const unsigned int TAM_BUFFER = 80;
	char hostname[60]; 
	get_hostname();
	get_user();
	hostname[0] = '\0';	
	strcat(hostname, "/home/");
	strcat(hostname, user_name);
	strcat(hostname, "/.sanity/");
	strcat(hostname, host_name);
	strcat(hostname, ".txt");
	// Abrindo log
	FILE* arquivo = fopen(hostname, "r");
	char buffer[TAM_BUFFER];
	list_store = gtk_list_store_new (NUM_COLS, G_TYPE_STRING, GDK_TYPE_PIXBUF);
	unsigned int j = 0;
	if(arquivo != NULL){
		while(fgets(buffer, TAM_BUFFER, arquivo)){
			if ( buffer[0] == '#'){
					unsigned int i=2, k=0;		
					char *program, *temp, *exp;
					program = (char *)calloc(12, sizeof(char));
					temp = (char *)calloc(40, sizeof(char));
					strcpy(temp, "/opt/sanity/share/icons/");
					exp = (char *)calloc(60, sizeof(char));
					while (buffer[i] != ' ') {
						program[i-2] = buffer[i];
						i++;
					}
					k = i+3;
					i=0;
					while(buffer[k] != '\0'){
						exp[i] = buffer[k];
						k++;
						i++;
					}
					exp[i-1] = ' ';
					if(j == 0) {
						create_list(exp);
						j++;
					}
					else {
						add_to_list(j, exp);
					}
					strcat(temp, program);
					strcat(temp, ".png");
					p1 = gdk_pixbuf_new_from_file (temp, &err);
					gtk_list_store_append (list_store, &iter);
					gtk_list_store_set (list_store, &iter, COL_DISPLAY_NAME, program,
									COL_PIXBUF, p1, -1);
					free(program);
					free(temp);
					free(exp);
					j++;
				}
			}  
			fclose(arquivo);
		}
		else {
			system("zenity --info --text=\"Nenhum arquivo de log foi encontrado!\"");
			return NULL;
		}
	return GTK_TREE_MODEL (list_store);
}
