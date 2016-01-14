/*	
 * Funções de organização de tela
 * Sanity
 */ 
 
GtkWidget *statusbar, *scrolled_window, *vbox, *icon_view;

void on_item_selected (GtkIconView *view, gpointer data) {
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
		gchar *text;
		gchar *string;
		path = (GtkTreePath *)current->data;
		gtk_tree_model_get_iter (model, &iter, path);
		gtk_tree_path_free (path);
		gtk_tree_model_get (model, &iter, COL_DISPLAY_NAME, &text, -1);
		string = search_in_list(text);
		guint id = gtk_statusbar_get_context_id(GTK_STATUSBAR(statusbar), "info");
		gtk_statusbar_push(GTK_STATUSBAR(statusbar), id, string);
		g_free (text);
	}
	while (current = g_list_next (current));
	g_list_free (selected);
}

gint center_mount(){
	// A partir daqui, cria-se a parte principal da interface
	scrolled_window = gtk_scrolled_window_new (NULL, NULL);
	gtk_container_add (GTK_CONTAINER (vbox), scrolled_window);
	gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (scrolled_window),
                                  GTK_POLICY_AUTOMATIC,
                                  GTK_POLICY_AUTOMATIC);
	gtk_scrolled_window_set_shadow_type (GTK_SCROLLED_WINDOW (scrolled_window),
                                       GTK_SHADOW_IN);
	GtkTreeModel *retorno = create_and_fill_model ();
	if(retorno == NULL){
		return 1;
	}
	icon_view = gtk_icon_view_new_with_model (retorno);
	gtk_container_add (GTK_CONTAINER (scrolled_window), icon_view);
	gtk_icon_view_set_text_column (GTK_ICON_VIEW (icon_view),
                                 COL_DISPLAY_NAME);
	gtk_icon_view_set_pixbuf_column (GTK_ICON_VIEW (icon_view), COL_PIXBUF);
	//gtk_icon_view_set_selection_mode (GTK_ICON_VIEW (icon_view),
                                    //GTK_SELECTION_MULTIPLE);
    // Sinal para ativação de icone
	g_signal_connect (G_OBJECT (icon_view), "item-activated",
 		      G_CALLBACK (on_item_selected), NULL);
	gtk_widget_show_all (scrolled_window);
	statusbar = gtk_statusbar_new();
	guint id = gtk_statusbar_get_context_id(GTK_STATUSBAR(statusbar), "info");
    gchar *info = "Para ver o erro correspondente, duplo clique no icone do programa.";
    gtk_statusbar_push(GTK_STATUSBAR(statusbar), id, info);
    gtk_box_pack_start(GTK_BOX (vbox), statusbar, FALSE, FALSE, 2);
	gtk_widget_show(statusbar);
	return 0;
}

void refazer() {
	gint bit;
	StartProgress();
	UpdateProgress(0, 7);
	system("./opt/sanity/progressbar.sh");
	system("run-parts --regex .sh /opt/sanity/modules/network");
	UpdateProgress(1, 7);
	system("run-parts --regex .sh /opt/sanitymodules/development");
	UpdateProgress(2, 7);
	system("run-parts --regex .sh /opt/sanity/modules/office");
	UpdateProgress(3, 7);
	system("run-parts --regex .sh /opt/sanity/modules/ide");
	UpdateProgress(4, 7);
	system("run-parts --regex .sh /opt/sanity/modules/utility");
	UpdateProgress(5, 7);
	system("run-parts --regex .sh /opt/sanity/modules/library");
	UpdateProgress(6, 7);
	system("./opt/sanity/select.sh");
	UpdateProgress(7, 7);
	EndProgress();
	// Destruindo elementos para refazê-los
	gtk_widget_destroy(statusbar);
	gtk_widget_destroy(scrolled_window);
	gtk_widget_destroy(icon_view);
	bit = center_mount();
	if(bit == 1){
		system("zenity --info --text=\"Nenhum arquivo de log foi encontrado!\"");
		return;
	}
}
