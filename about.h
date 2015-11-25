/*	Componente gtk correspondente à opção sobre (about) */

static void help_clicked(GtkWindow *window) {
    const gchar *authors[] = { "Igor Nascimento dos Santos", 
						"Artur Santos Nascimento (office test)", NULL };
    const gchar *license =
	"This program is free software; you can redistribute it and/or modify it "
	"under the terms of the GNU General Public License as published by "
	"the Free Software Foundation; either version 3 of the License, or "
	"(at your option) any later version.\n"
	"\n"
	"This program is distributed in the hope that it will be useful, "
	"but WITHOUT ANY WARRANTY; without even the implied warranty of "
	"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the "
	"GNU General Public License for more details.\n"
	"\n"
	"You should have received a copy of the GNU General Public License "
	"along with this program.  If not, see http://www.gnu.org/licenses/ .";
	const gchar *comments = 
						"Uma aplicação que testa os softwares que você mais utiliza. \
						Um projeto totalmente open-source.";
    GdkPixbuf *logo = NULL;
    if(logo == NULL)
		logo = gdk_pixbuf_new_from_file("Firefox.png", NULL);
    gtk_show_about_dialog(window,
                            "authors", authors,"license", license,
                            "logo", logo,
                            "program-name", "Sanity",
                            "version", "0.3",
                            "comments", comments,
                            "website", "http://igormoraisn.github.io/sanity", 
                            "website-label", "Visite o Site",
                            "copyright", "(C) 2015 Igor Nascimento",
                            "wrap-license", TRUE, NULL);
}
