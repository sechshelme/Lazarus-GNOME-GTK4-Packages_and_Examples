
// gcc -o main main.c `pkg-config --cflags --libs gtk4`

#include <gtk/gtk.h>

void object_free(gpointer data)
{
  g_printf("free object\n");
  g_free(data);
}

static void add_item(GListStore* store ) {
  GObject* obj = g_object_new(G_TYPE_OBJECT, NULL);
  for (int j = 0; j < 3; j++) {
      gint * value = g_new(gint, 1); 
      *value = g_random_int_range(1, 100);  
      g_object_set_data_full(obj, g_strdup_printf("item-object-%d", j), value, object_free);
  }
  g_list_store_append(store, obj);
  g_object_unref(obj);
}

static gint compareFunc(gconstpointer a, gconstpointer b, gpointer user_data) {
    int column_index = GPOINTER_TO_INT(user_data);
    gint *int_a = g_object_get_data(G_OBJECT(a), g_strdup_printf("item-object-%d", column_index));
    gint *int_b = g_object_get_data(G_OBJECT(b), g_strdup_printf("item-object-%d", column_index));
    return *int_a - *int_b;
}

static void setup_cb(GtkSignalListItemFactory* factory, GtkListItem* list_item, gpointer user_data) {
    GtkWidget* label = gtk_label_new(NULL);
    gtk_list_item_set_child(list_item, label);
}

static void bind_number_cb(GtkSignalListItemFactory* factory, GtkListItem* list_item, gpointer user_data) {
    int column_index = GPOINTER_TO_INT(user_data);
    GtkWidget* label = gtk_list_item_get_child(list_item);
    GObject* item = gtk_list_item_get_item(list_item);
    gint *value = g_object_get_data(item, g_strdup_printf("item-object-%d", column_index));
    char buffer[32];
    snprintf(buffer, sizeof(buffer), "%d", *value);
    gtk_label_set_text(GTK_LABEL(label), buffer);
}

static void activate(GtkApplication* app, gpointer user_data) {
    GtkWidget* window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Sort Example");
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 300);

    GtkWidget* scrolled_window = gtk_scrolled_window_new();
    gtk_window_set_child(GTK_WINDOW(window), scrolled_window);

    GtkWidget* column_view = gtk_column_view_new(NULL);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), column_view);

    // Erstellen des Sortierers für die ColumnView
    GtkSorter *view_sorter = gtk_column_view_get_sorter(GTK_COLUMN_VIEW(column_view));
    GListStore* store = g_list_store_new(G_TYPE_OBJECT);
    GtkSortListModel *sort_model = gtk_sort_list_model_new(G_LIST_MODEL(store), view_sorter);
    GtkSelectionModel* selection_model = GTK_SELECTION_MODEL(gtk_single_selection_new(G_LIST_MODEL(sort_model)));
    g_object_unref(view_sorter);


    gtk_column_view_set_model(GTK_COLUMN_VIEW(column_view), selection_model);

    const char* column_titles[] = {"Number 1", "Number 2", "Number 3"};
    for (int i = 0; i < 3; i++) {
        GtkListItemFactory* factory = gtk_signal_list_item_factory_new();
        g_signal_connect(factory, "setup", G_CALLBACK(setup_cb), NULL);
        g_signal_connect(factory, "bind", G_CALLBACK(bind_number_cb), GINT_TO_POINTER(i));

        GtkColumnViewColumn* column = gtk_column_view_column_new(column_titles[i], factory);
        gtk_column_view_append_column(GTK_COLUMN_VIEW(column_view), column);

        GtkSorter *column_sorter = GTK_SORTER(gtk_custom_sorter_new(compareFunc, GINT_TO_POINTER(i), NULL));
        gtk_column_view_column_set_sorter(column, column_sorter);
        g_object_unref(column_sorter);
        g_object_unref(column);
    }

    add_item(store);
    add_item(store);
    add_item(store);
    add_item(store);

    g_list_store_remove(store, 1); // free io.

    gtk_window_present(GTK_WINDOW(window));

//  g_signal_connect_swapped(scrolled_window, "destroy", G_CALLBACK(g_object_unref), store);
//    g_object_unref(selection_model); // Freigeben des SelectionModels
}

int main(int argc, char** argv) {
    GtkApplication* app = gtk_application_new("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
    return status;
}

