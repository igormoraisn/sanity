// Funções de menu do Sanity

static void wiki_browsed(){
	// Verificar pipe
	popen("xdg-open http://admin.dcomp.ufs.br/wiki/index.php/Página_principal", "r");
}

static void soft_list(){
	gchar *string = "cat Program_List | zenity --list --text=\"A seguir, vemos os programas testados:\" --cancel-label=\"Voltar\" --width=400 --height=400 --column \"Programa\" --column \"Função\"";
	system(string);
}

static void msg_send(){
	gchar *msg = "zenity --text-info --editable --cancel-label=\"Voltar\" --ok-label=\"Enviar\" --checkbox=\"Eu tenho plena ciência das informações que estou enviando.\"";
	system(msg);
}

static void on_window_destroy(GtkWidget *widget,
								gpointer data) {
	g_print("Obrigado por utilizar o Sanity :)\n");
	gtk_main_quit();
}

