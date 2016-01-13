/* Sanity
 * Módulo de interface principal GTK
 * Versão 0.3
 * gcc -o sanity sanity.c `pkg-config --libs --cflags gtk+-2.0`
 */

#include <gtk/gtk.h>
#include <stdlib.h>

#include "about.h"
#include "progressbar.c"
#include "createmodel.c"
#include "frameorganization.c"
#include "functions.h"

int main (int argc, char *argv[]) {
	GtkWidget *window, *menu, *menu_bar, *arquivo, *ajuda, *options,
				*menu_items, *file_menu, *options_menu,
				*help_menu, *sobre, *relatar_erro, *refazer_teste, *sair,
				*ajuda_item, *listar_software, *wiki, *label;
	GdkPixbuf *icon;
	GtkTreePath *path;
	gtk_init (&argc, &argv);
	
	// Criando uma nova janela
	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	gtk_window_set_title(GTK_WINDOW (window), "Sanity");
	gtk_signal_connect(GTK_OBJECT (window), "destroy",
						(GtkSignalFunc) gtk_exit, NULL);
	gtk_widget_set_size_request(GTK_WIDGET (window), 700, 500);
	gtk_container_set_border_width (GTK_CONTAINER (window), 10);
	gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER_ALWAYS);
	icon = gdk_pixbuf_new_from_file ("share/icons/sanity32.png", NULL);
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

	// Create a menu-bar to hold the menus and add it to our main window
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
	
    // Associando submenus a ícones
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
	g_signal_connect(G_OBJECT (listar_software), "activate",
						G_CALLBACK (soft_list),
						(GtkWindow*) window);
	g_signal_connect(G_OBJECT (relatar_erro), "activate",
						G_CALLBACK (msg_send),
						(GtkWindow*) window);
	gtk_widget_show(menu_bar);
	gtk_box_pack_start(GTK_BOX (vbox), menu_bar, FALSE, FALSE, 2);
	label = gtk_label_new_with_mnemonic ("\t\t\tBem vindo ao Sanity! \
				\nAbaixo, estão listados os problemas encontrados.");
	gtk_container_add (GTK_CONTAINER (vbox), label);
	// Montando os elementos do centro da interface (icon view, scrolled
	// window e statusbar
	center_mount();
	
	/* always display the window as the last step so it all splashes 
	 * on the screen at once. */
	gtk_widget_show_all(window);
	gtk_main ();
	return 0;
}

