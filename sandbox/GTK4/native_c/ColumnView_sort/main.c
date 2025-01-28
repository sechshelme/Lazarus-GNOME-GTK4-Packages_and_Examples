
// gcc -o main main.c `pkg-config --cflags --libs gtk4`

#include <gtk/gtk.h>

static GListModel* create_model() {
    GListStore* store = g_list_store_new(G_TYPE_OBJECT);
    for (int i = 1; i < 8; i++) {
        GObject* obj = g_object_new(G_TYPE_OBJECT, NULL);
        gint * value = g_new(gint, 1); 
        *value = i;
        g_object_set_data_full(obj, "item-object", value, g_free);
        g_list_store_append(store, obj);
        g_object_unref(obj);
    }
    return G_LIST_MODEL(store);
}

static gint compareFunc(gconstpointer a, gconstpointer b, gpointer data)
{
  g_print("compare func\n");

    gint * int_a = g_object_get_data(G_OBJECT(a), "item-object");
    gint * int_b = g_object_get_data(G_OBJECT(b), "item-object");

    g_print("compare func  %d   %d  \n", *int_a, *int_b);

    return *int_a - *int_b;
}

static void setup_cb(GtkSignalListItemFactory* factory, GtkListItem* list_item, gpointer user_data) {
    GtkWidget* label = gtk_label_new(NULL);
    gtk_list_item_set_child(list_item, label);
}

static void bind_number_cb(GtkSignalListItemFactory* factory, GtkListItem* list_item, gpointer user_data) {
    GtkWidget* label = gtk_list_item_get_child(list_item);
    GObject* item = gtk_list_item_get_item(list_item);
    gint *value = g_object_get_data(item, "item-object");
    char buffer[32];
    snprintf(buffer, sizeof(buffer), "%d", *value);
    gtk_label_set_text(GTK_LABEL(label), buffer);
}

static void activate(GtkApplication* app, gpointer user_data) {
    GtkWidget* window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Sort Test");
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 300);

    GtkWidget* scrolled_window = gtk_scrolled_window_new();
    gtk_window_set_child(GTK_WINDOW(window), scrolled_window);

    // Erstellen des Basismodells
    GListModel* model = create_model();

    // Erstellen des ColumnView
    GtkWidget* column_view = gtk_column_view_new(NULL);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

    // Erstellen des Sortierers für die ColumnView
    GtkSorter *view_sorter = gtk_column_view_get_sorter(GTK_COLUMN_VIEW(column_view));

    // Erstellen des sortierten Modells
    GtkSortListModel *sort_model = gtk_sort_list_model_new(model, view_sorter);

    // Erstellen des Selektionsmodells
    GtkSelectionModel* selection_model = GTK_SELECTION_MODEL(gtk_single_selection_new(G_LIST_MODEL(sort_model)));

    // Setzen des Modells für die ColumnView
    gtk_column_view_set_model(GTK_COLUMN_VIEW(column_view), selection_model);

    // Erstellen der Factory für die Listenelemente
    GtkListItemFactory* number_factory = gtk_signal_list_item_factory_new();
    g_signal_connect(number_factory, "setup", G_CALLBACK(setup_cb), NULL);
    g_signal_connect(number_factory, "bind", G_CALLBACK(bind_number_cb), NULL);

    // Erstellen und Hinzufügen der Spalte
    GtkColumnViewColumn* column = gtk_column_view_column_new("Numbers", number_factory);
    gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

    // Erstellen und Setzen des Spaltensortierers
    GtkSorter *column_sorter = GTK_SORTER(gtk_custom_sorter_new(compareFunc, NULL, NULL));
    gtk_column_view_column_set_sorter(column, column_sorter);

    // Initiale Sortierung (optional)
    // gtk_column_view_sort_by_column(GTK_COLUMN_VIEW(column_view), column, GTK_SORT_ASCENDING);

    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char** argv) {
    GtkApplication* app = gtk_application_new("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
    return status;
}




