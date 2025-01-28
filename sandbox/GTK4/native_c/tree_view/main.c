
// gcc -o main main.c `pkg-config --cflags --libs gtk4`

#include <gtk/gtk.h>

enum {
    COLUMN_NAME,
    COLUMN_AGE,
    N_COLUMNS
};

static void activate(GtkApplication *app, gpointer user_data) {
    // Erstelle ListStore
    GtkListStore *list_store = gtk_list_store_new(N_COLUMNS, 
                                                  G_TYPE_STRING,   // Name
                                                  G_TYPE_INT);     // Alter

    GtkTreeIter iter;
    gtk_list_store_append(list_store, &iter);
    gtk_list_store_set(list_store, &iter, 
                       COLUMN_NAME, "Max Mustermann", 
                       COLUMN_AGE, 30, 
                       -1);

    gtk_list_store_append(list_store, &iter);
    gtk_list_store_set(list_store, &iter, 
                       COLUMN_NAME, "Anna Schmidt", 
                       COLUMN_AGE, 25, 
                       -1);

    // Erstelle Hauptfenster
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Personen Liste");
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    // Erstelle TreeView
    GtkWidget *tree_view = gtk_tree_view_new_with_model(GTK_TREE_MODEL(list_store));

    // Spalten hinzufügen
    GtkCellRenderer *renderer = gtk_cell_renderer_text_new();
    
    GtkTreeViewColumn *name_column = gtk_tree_view_column_new_with_attributes(
        "Name", renderer, "text", COLUMN_NAME, NULL);
    gtk_tree_view_append_column(GTK_TREE_VIEW(tree_view), name_column);

    GtkTreeViewColumn *age_column = gtk_tree_view_column_new_with_attributes(
        "Alter", renderer, "text", COLUMN_AGE, NULL);
    gtk_tree_view_append_column(GTK_TREE_VIEW(tree_view), age_column);

    // ScrolledWindow für TreeView
    GtkWidget *scrolled_window = gtk_scrolled_window_new();
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), tree_view);

    // Fenster anzeigen
    gtk_window_set_child(GTK_WINDOW(window), scrolled_window);
    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
    GtkApplication *app = gtk_application_new("org.example.liststore", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
    return status;
}

