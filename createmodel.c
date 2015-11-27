
#include "savelist.c"

enum
{
  COL_DISPLAY_NAME,
  COL_PIXBUF,
  NUM_COLS
};


/* Create the ListStore and fill it with required data */
GtkTreeModel *create_and_fill_model (void) 
{
	GtkListStore *list_store;
	GdkPixbuf *p1;
	GtkTreeIter iter;
	GError *err = NULL;
	const unsigned int TAM_BUFFER = 70;
	char hostname[60];
	system("./access.sh");
	FILE *host = fopen("/tmp/hostname", "r");
	if(host != NULL) {
		fgets(hostname, 60, host);
		// Abrindo log
		FILE *arquivo = fopen(hostname, "r");
		char buffer[TAM_BUFFER];
		list_store = gtk_list_store_new (NUM_COLS, G_TYPE_STRING, GDK_TYPE_PIXBUF);
		unsigned int j = 0;
		if(arquivo != NULL){
			while(fgets(buffer, TAM_BUFFER, arquivo)){
				printf("%s\n", buffer);
				if ( buffer[0] == '#'){
					if(j == 0) {
						create_list(buffer);
						j++;
					}
					else {
						add_to_list(j, buffer);
					}
						unsigned int i=2;
						char *program, *temp;
						program = (char *)calloc(12, sizeof(char));
						temp = (char *)calloc(40, sizeof(char));
						strcpy(temp, "share/icons/");
						while (buffer[i] != ' ') {
							program[i-2] = buffer[i];
							i++;
						}
						strcat(temp, program);
						strcat(temp, ".png");
						p1 = gdk_pixbuf_new_from_file (temp, &err);
						gtk_list_store_append (list_store, &iter);
						gtk_list_store_set (list_store, &iter, COL_DISPLAY_NAME, program,
									COL_PIXBUF, p1, -1);
						free(program);
						free(temp);
						j++;
					}
				}  
			fclose(arquivo);
			remove("/tmp/hostname");
		}
		else 
			printf("Não foi encontrado nenhum erro!");
	}
	else {
		printf("O teste não foi realizado!");
	}
	print_list();
	return GTK_TREE_MODEL (list_store);
}
