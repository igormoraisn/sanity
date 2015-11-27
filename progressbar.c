/*
 * Progress bar
 * Incomplete
 * 
 */

#include <gtk/gtk.h>
#include <stdlib.h>
GtkWidget *icon_view;

typedef struct {

    GtkWidget *progressbar;
    GtkWidget *window;
    int bProgressUp;
    int nLastPct;

} typProgressData;

typProgressData *pdata = NULL;

/*
 * CanWindowClose
 *
 * Function that determines that if the dialog
 * window can be closed.
 */
gint CanWindowClose (GtkWidget *widget)
{
    /* --- TRUE => cannot close --- */
    /* --- FALSE => can close --- */
    return (pdata->bProgressUp);
}

/*
 * UpdateProgress
 *
 * Update the progress window to reflect the state
 * of the file that is being loaded.  
 *
 * pos - how much of the file has been loaded.
 * len - length of the file
 * (pos / len) = % file has been loaded.
 */
void UpdateProgress (unsigned int pos, unsigned int len)
{
    gfloat pvalue;
    int pct;
 
    /* --- Prevent divide by zero errors --- */
    if (len > 0) {

        /* --- Calculate the percentage --- */
        pvalue = (gfloat) pos / (gfloat) len;
    
        pct = pvalue * 100;

        if (pdata->nLastPct != pct) {

            /* --- Update the displayed value --- */
            gtk_progress_set_percentage (GTK_PROGRESS (pdata->progressbar), 
                                         pvalue);

            /* --- Repaint any windows - like the progress bar --- */
            while (gtk_events_pending ()) {
                gtk_main_iteration ();
            }
            pdata->nLastPct = pct;
        }
    }
}



/*
 * StartProgress 
 *
 * Create a window for the progress bar
 */
void StartProgress ()
{
    GtkWidget *label;
    GtkWidget *table;
    GtkWidget *window;
    GtkAdjustment *adj;
    pdata = g_malloc (sizeof (typProgressData));
    pdata->nLastPct = -1;
    pdata->bProgressUp = TRUE;
    /*
     * --- Create the top level window
     */
    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
    pdata->window = window;
    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER_ALWAYS);
    /* --- Hook up the destroy  --- */
    gtk_signal_connect (GTK_OBJECT (window), "delete_event",
			GTK_SIGNAL_FUNC (CanWindowClose), pdata);
    
    gtk_container_border_width (GTK_CONTAINER (window), 10);
    
    /* --- Create a table --- */
    table = gtk_table_new (3, 2, TRUE);
    gtk_container_add (GTK_CONTAINER (window), table);
    
    /* --- Add a label to the table --- */
    label = gtk_label_new ("Realizando Testes...");
    gtk_table_attach_defaults (GTK_TABLE (table), label, 0,2,0,1);
    gtk_widget_show (label);
    
    /* --- Add the progress bar to the table --- */
    adj = (GtkAdjustment *) gtk_adjustment_new (0, 0, 400, 0, 0, 0);
    pdata->progressbar = gtk_progress_bar_new_with_adjustment (adj);
    gtk_table_attach_defaults (GTK_TABLE (table), 
                               pdata->progressbar, 0,2,1,2);
    gtk_widget_show (pdata->progressbar);

    
    /* --- Show everything --- */
    gtk_widget_show (table);
    gtk_widget_show (window);
}


/*
 * EndProgress
 *
 * Close down the progress bar.
 */
void EndProgress ()
{
    /* --- Allow it to close --- */
    pdata->bProgressUp = FALSE;

    /* --- Destroy the window --- */
    gtk_widget_destroy (pdata->window);

    /* --- Free used memory. --- */
    g_free (pdata);

    pdata = NULL;
}

void refazer() {
	StartProgress();
	UpdateProgress(0, 7);
	system("./progressbar.sh");
	system("run-parts --regex .sh modules/network");
	UpdateProgress(1, 7);
	system("run-parts --regex .sh modules/development");
	UpdateProgress(2, 7);
	system("run-parts --regex .sh modules/office");
	UpdateProgress(3, 7);
	system("run-parts --regex .sh modules/ide");
	UpdateProgress(4, 7);
	system("run-parts --regex .sh modules/utility");
	UpdateProgress(5, 7);
	system("run-parts --regex .sh modules/library");
	UpdateProgress(6, 7);
	system("./select.sh");
	UpdateProgress(7, 7);
	EndProgress();
}
