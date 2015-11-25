/* Sanity
 * gcc -o sanity sanity.c `pkg-config --libs --cflags gtk+-2.0`
 */

#include <gtk/gtk.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "about.h"
#include "progressbar.c"

enum
{
  COL_DISPLAY_NAME,
  COL_PIXBUF,
  NUM_COLS
};

void print_selected_elements (GtkIconView *view) 
{
	GtkTreeModel *model;
	GList *selected, *current;
	selected = gtk_icon_view_get_selected_items (view);
	if (!selected)
		return;
	model = gtk_icon_view_get_model (view);
	current = selected;
	do {
		GtkTreePath *path;
		GtkTreeIter iter;
		char *text;
		path = (GtkTreePath *)current->data;
		gtk_tree_model_get_iter (model, &iter, path);
		gtk_tree_path_free (path);
		gtk_tree_model_get (model, &iter, COL_DISPLAY_NAME, &text, -1);
		printf("Selected item: %s\n", text);
		g_free (text);
	}
	while (current = g_list_next (current));
	g_list_free (selected);
}

/* Create the ListStore and fill it with required data */
GtkTreeModel *create_and_fill_model (void) 
{
	GtkListStore *list_store;
	GdkPixbuf *p1, *p2;
	GtkTreeIter iter;
	GError *err = NULL;
	const unsigned int TAM_BUFFER = 70;
	char hostname[40];
	system("./access.sh");
	FILE *host = fopen("/tmp/hostname", "r");
	fgets(hostname, 40, host);
	// Abrindo log
	FILE *arquivo = fopen(hostname, "r");
	char buffer[TAM_BUFFER];
	list_store = gtk_list_store_new (NUM_COLS, G_TYPE_STRING, GDK_TYPE_PIXBUF);
	if(arquivo != NULL){
		while(fgets(buffer, TAM_BUFFER, arquivo)){
			printf("%s\n", buffer);
			if ( buffer[0] == '#'){
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
			}
		}	  
		fclose(arquivo);
		remove("/tmp/hostname");
	}
	else 
		printf("Nao foi possivel abrir o arquivo.");
	return GTK_TREE_MODEL (list_store);
}

static void on_window_destroy(GtkWidget *widget,
								gpointer data)
{
	printf("Obrigado por utilizar o Sanity :)\n");
	gtk_main_quit();
}

int main (int argc, char *argv[]) {
	GtkWidget *window;
	GtkWidget *menu;
	GtkWidget *menu_bar;
	GtkWidget *arquivo;
	GtkWidget *ajuda;
	GtkWidget *options;
	GtkWidget *menu_items;
	GtkWidget *vbox;
	GtkWidget *file_menu, *options_menu, *help_menu;
	GtkWidget *sobre, *relatar_erro, *refazer_teste, *sair,
				*ajuda_item, *listar_software, *wiki;
	GtkWidget *icon_view;
	GtkWidget *scrolled_window;
	GtkWidget *label, *statusbar;
	gchar *info;
	GtkTreePath *path;
	gtk_init (&argc, &argv);
	
	/* create a new window */
	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	gtk_window_set_title(GTK_WINDOW (window), "Sanity");
	gtk_signal_connect(GTK_OBJECT (window), "destroy",
						(GtkSignalFunc) gtk_exit, NULL);
	gtk_widget_set_size_request(GTK_WIDGET (window), 600, 400);
	gtk_container_set_border_width (GTK_CONTAINER (window), 10);
	/* Init the menu-widget, and remember -- never
	* gtk_show_widget() the menu widget!! */
	vbox = gtk_vbox_new(FALSE, 0);
	gtk_container_add(GTK_CONTAINER (window), vbox);
	gtk_widget_show(vbox);
	menu_bar = gtk_menu_bar_new();
	
	// Criando os menus
	arquivo = gtk_menu_item_new_with_label("Arquivo");
	options = gtk_menu_item_new_with_label("Opções");
	ajuda = gtk_menu_item_new_with_label("Ajuda");
	
	// Mostrando os menus	
	gtk_widget_show(arquivo);
	gtk_widget_show(options);
	gtk_widget_show(ajuda);

	/* Create a menu-bar to hold the menus and add it to our main window*/
	gtk_container_add(GTK_CONTAINER(window), menu_bar);
	gtk_menu_shell_append(GTK_MENU_SHELL (menu_bar), arquivo);
	gtk_menu_shell_append(GTK_MENU_SHELL (menu_bar), options);
	gtk_menu_shell_append(GTK_MENU_SHELL (menu_bar), ajuda);
        
	file_menu = gtk_menu_new();
	options_menu = gtk_menu_new();
	help_menu = gtk_menu_new();
        
	gtk_menu_item_set_submenu(GTK_MENU_ITEM(arquivo), file_menu);
	gtk_menu_item_set_submenu(GTK_MENU_ITEM(options), options_menu);
	gtk_menu_item_set_submenu(GTK_MENU_ITEM(ajuda), help_menu);
	  
	sair = gtk_image_menu_item_new_with_label("Sair");
	relatar_erro = gtk_image_menu_item_new_with_label("Relatar Erro ao Servidor");
	refazer_teste = gtk_image_menu_item_new_with_label("Refazer Teste");
	ajuda_item = gtk_image_menu_item_new_with_label("Ajuda");
	sobre = gtk_image_menu_item_new_with_label("Sobre");
	wiki = gtk_image_menu_item_new_with_label("Wiki");
	listar_software = gtk_image_menu_item_new_with_label("Listar Softwares Testados");
    
    gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(sair), 
									gtk_image_new_from_stock
									(GTK_STOCK_QUIT, GTK_ICON_SIZE_MENU)); 
    gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(sobre), 
									gtk_image_new_from_stock
									(GTK_STOCK_ABOUT, GTK_ICON_SIZE_MENU)); 
    gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(ajuda_item), 
									gtk_image_new_from_stock
									(GTK_STOCK_HELP, GTK_ICON_SIZE_MENU)); 
    gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(refazer_teste), 
									gtk_image_new_from_stock
									(GTK_STOCK_REFRESH, GTK_ICON_SIZE_MENU));
    gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(listar_software), 
									gtk_image_new_from_stock
									(GTK_STOCK_DND, GTK_ICON_SIZE_MENU)); 
    gtk_image_menu_item_set_image(GTK_IMAGE_MENU_ITEM(relatar_erro), 
									gtk_image_new_from_stock
									(GTK_STOCK_GOTO_TOP, GTK_ICON_SIZE_MENU)); 
    
    gtk_menu_shell_append( GTK_MENU_SHELL (file_menu), sair);
	gtk_menu_shell_append( GTK_MENU_SHELL (options_menu), listar_software);
	gtk_menu_shell_append( GTK_MENU_SHELL (options_menu), refazer_teste);
	gtk_menu_shell_append( GTK_MENU_SHELL (options_menu), relatar_erro);
	gtk_menu_shell_append( GTK_MENU_SHELL (help_menu), ajuda_item);
	gtk_menu_shell_append( GTK_MENU_SHELL (help_menu), wiki);
	gtk_menu_shell_append( GTK_MENU_SHELL (help_menu), sobre);
        
	// Ativando os eventos
	g_signal_connect(G_OBJECT (sair), "activate",
						G_CALLBACK (on_window_destroy),
						(GtkWindow*) window);
	g_signal_connect(G_OBJECT (sobre), "activate",
						G_CALLBACK (help_clicked),
						(GtkWindow*) window);
	g_signal_connect(G_OBJECT (refazer_teste), "activate",
						G_CALLBACK (refazer),
						(GtkWindow*) window);
	gtk_widget_show(menu_bar);
	gtk_box_pack_start(GTK_BOX (vbox), menu_bar, FALSE, FALSE, 2);
	label = gtk_label_new_with_mnemonic ("\t\t\tBem vindo ao Sanity! \
				\nAbaixo, estão listados os problemas encontrados.");
	gtk_container_add (GTK_CONTAINER (vbox), label);
	
	// A partir daqui, cria-se a parte principal da interface
	scrolled_window = gtk_scrolled_window_new (NULL, NULL);
	gtk_container_add (GTK_CONTAINER (vbox), scrolled_window);
	gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (scrolled_window),
                                  GTK_POLICY_AUTOMATIC,
                                  GTK_POLICY_AUTOMATIC);
	gtk_scrolled_window_set_shadow_type (GTK_SCROLLED_WINDOW (scrolled_window),
                                       GTK_SHADOW_IN);
	icon_view = gtk_icon_view_new_with_model (create_and_fill_model ());
	gtk_container_add (GTK_CONTAINER (scrolled_window), icon_view);
	gtk_icon_view_set_text_column (GTK_ICON_VIEW (icon_view),
                                 COL_DISPLAY_NAME);
	gtk_icon_view_set_pixbuf_column (GTK_ICON_VIEW (icon_view), COL_PIXBUF);
	gtk_icon_view_set_selection_mode (GTK_ICON_VIEW (icon_view),
                                    GTK_SELECTION_MULTIPLE);

	gtk_widget_show_all (scrolled_window);
	
	statusbar = gtk_statusbar_new();
	guint id = gtk_statusbar_get_context_id(GTK_STATUSBAR(statusbar), "info");
	 info = "";
    gtk_statusbar_push(GTK_STATUSBAR(statusbar), id, info);
    gtk_box_pack_start(GTK_BOX (vbox), statusbar, FALSE, FALSE, 2);
	/* always display the window as the last step so it all splashes 
	 * on the screen at once. */
	gtk_widget_show_all(window);
	gtk_main ();
	print_selected_elements(GTK_ICON_VIEW(icon_view));
	return 0;
}

