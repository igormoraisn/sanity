/* Sanity
 * gcc -o sanity sanity.c `pkg-config --libs --cflags gtk+-2.0`
 */

#include <gtk/gtk.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "about.h"
#include "progressbar.c"
#include "createmodel.c"

GtkWidget *statusbar;

void on_item_selected (GtkIconView *view, gpointer data) 
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
		char *string;
		path = (GtkTreePath *)current->data;
		gtk_tree_model_get_iter (model, &iter, path);
		gtk_tree_path_free (path);
		gtk_tree_model_get (model, &iter, COL_DISPLAY_NAME, &text, -1);
		printf("Selected item: %s\n", text);
		string = search_in_list(text);
		guint id = gtk_statusbar_get_context_id(GTK_STATUSBAR(statusbar), "info");
		gtk_statusbar_push(GTK_STATUSBAR(statusbar), id, string);
		g_free (text);
	}
	while (current = g_list_next (current));
	g_list_free (selected);
}

static void wiki_browsed(){
	system("xdg-open http://admin.dcomp.ufs.br/wiki/index.php/Página_principal");
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
	GtkWidget *scrolled_window;
	GtkWidget *label;
	GdkPixbuf *icon;
	gchar *info;
	GtkTreePath *path;
	gtk_init (&argc, &argv);
	
	/* create a new window */
	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	gtk_window_set_title(GTK_WINDOW (window), "Sanity");
	gtk_signal_connect(GTK_OBJECT (window), "destroy",
						(GtkSignalFunc) on_window_destroy, NULL);
	gtk_widget_set_size_request(GTK_WIDGET (window), 600, 400);
	gtk_container_set_border_width (GTK_CONTAINER (window), 10);
	gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER_ALWAYS);
	icon = gdk_pixbuf_new_from_file ("sanity32.png", NULL);
	gtk_window_set_icon(GTK_WINDOW(window), icon);
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
	g_signal_connect(G_OBJECT (wiki), "activate",
						G_CALLBACK (wiki_browsed),
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
	//gtk_icon_view_set_selection_mode (GTK_ICON_VIEW (icon_view),
                                    //GTK_SELECTION_MULTIPLE);
	g_signal_connect (G_OBJECT (icon_view), "item-activated",
 		      G_CALLBACK (on_item_selected), NULL);
	gtk_widget_show_all (scrolled_window);
	
	statusbar = gtk_statusbar_new();
	// Sinal para ativação de icone
	guint id = gtk_statusbar_get_context_id(GTK_STATUSBAR(statusbar), "info");
    info = "Para ver o erro correspondente, clique no icone do programa.";
    gtk_statusbar_push(GTK_STATUSBAR(statusbar), id, info);
    gtk_box_pack_start(GTK_BOX (vbox), statusbar, FALSE, FALSE, 2);
	/* always display the window as the last step so it all splashes 
	 * on the screen at once. */
	gtk_widget_show_all(window);
	gtk_main ();
	return 0;
}

