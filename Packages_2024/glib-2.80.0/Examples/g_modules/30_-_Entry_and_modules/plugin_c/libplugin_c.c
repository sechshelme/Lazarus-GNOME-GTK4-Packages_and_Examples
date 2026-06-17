// gcc -Wall -fPIC -shared -o libplugin_c.so libplugin_c.c `pkg-config --cflags --libs gtk4`


#include <gtk/gtk.h>

static void on_button_clicked(GtkWidget *button, gpointer user_data) {
    g_print("Zusatz C wurde gedrückt!\n");
}

typedef struct {
    GtkWidget *toolbar;
    GtkWidget *entry;
} widgetstruct;

void Plugin_init_C(widgetstruct *w) {
    g_print("Plugin_c wird geladen!\n");
    GtkWidget *button = gtk_button_new_with_label("Zusatz C");
    g_signal_connect(button, "clicked", G_CALLBACK(on_button_clicked), NULL);
    gtk_box_append(GTK_BOX(w->toolbar), button);
    gtk_widget_set_visible(button, TRUE);
}

