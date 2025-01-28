
// gcc -o main main.c `pkg-config --cflags --libs gtk4`

// https://www.perplexity.ai/search/gtk-dialog-new-with-buttons-is-cl4G.w3VQw.2VhcPlk1wBw

#include <gtk/gtk.h>

#include <gtk/gtk.h>

static void
update_main_window(GtkWidget *main_window, const char *vorname, const char *nachname)
{
    GtkWidget *box = gtk_window_get_child(GTK_WINDOW(main_window));
    GtkWidget *vorname_label = gtk_widget_get_first_child(box);
    GtkWidget *nachname_label = gtk_widget_get_next_sibling(vorname_label);

    char *vorname_text = g_strdup_printf("Vorname: %s", vorname);
    char *nachname_text = g_strdup_printf("Nachname: %s", nachname);

    gtk_label_set_text(GTK_LABEL(vorname_label), vorname_text);
    gtk_label_set_text(GTK_LABEL(nachname_label), nachname_text);

    g_free(vorname_text);
    g_free(nachname_text);
}

static void
on_ok_clicked(GtkButton *button, gpointer user_data)
{
    GtkWidget *window = gtk_widget_get_ancestor(GTK_WIDGET(button), GTK_TYPE_WINDOW);
    GtkWidget *box = gtk_window_get_child(GTK_WINDOW(window));
    GtkWidget *vorname_entry = gtk_widget_get_next_sibling(gtk_widget_get_first_child(box));
    GtkWidget *nachname_entry = gtk_widget_get_next_sibling(gtk_widget_get_next_sibling(vorname_entry));

    const char *vorname = gtk_editable_get_text(GTK_EDITABLE(vorname_entry));
    const char *nachname = gtk_editable_get_text(GTK_EDITABLE(nachname_entry));

    update_main_window(GTK_WIDGET(user_data), vorname, nachname);

    gtk_window_destroy(GTK_WINDOW(window));
}

static void
on_enter_data_clicked(GtkButton *button, gpointer user_data)
{
    GtkWidget *window = gtk_window_new();
    gtk_window_set_title(GTK_WINDOW(window), "Daten eingeben");
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    GtkWidget *vorname_entry = gtk_entry_new();
    GtkWidget *nachname_entry = gtk_entry_new();
    
    gtk_box_append(GTK_BOX(box), gtk_label_new("Vorname:"));
    gtk_box_append(GTK_BOX(box), vorname_entry);
    gtk_box_append(GTK_BOX(box), gtk_label_new("Nachname:"));
    gtk_box_append(GTK_BOX(box), nachname_entry);

    GtkWidget *button_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    GtkWidget *ok_button = gtk_button_new_with_label("OK");
    GtkWidget *cancel_button = gtk_button_new_with_label("Abbrechen");

    gtk_box_append(GTK_BOX(button_box), ok_button);
    gtk_box_append(GTK_BOX(button_box), cancel_button);
    gtk_box_append(GTK_BOX(box), button_box);

    g_signal_connect(ok_button, "clicked", G_CALLBACK(on_ok_clicked), user_data);
    g_signal_connect_swapped(cancel_button, "clicked", G_CALLBACK(gtk_window_destroy), window);

    gtk_window_present(GTK_WINDOW(window));
}

static void
activate(GtkApplication *app, gpointer user_data)
{
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Hauptfenster");
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 300);

    GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    GtkWidget *vorname_label = gtk_label_new("Vorname: ");
    GtkWidget *nachname_label = gtk_label_new("Nachname: ");
    GtkWidget *enter_button = gtk_button_new_with_label("Daten eingeben");

    gtk_box_append(GTK_BOX(box), vorname_label);
    gtk_box_append(GTK_BOX(box), nachname_label);
    gtk_box_append(GTK_BOX(box), enter_button);

    g_signal_connect(enter_button, "clicked", G_CALLBACK(on_enter_data_clicked), window);

    gtk_window_present(GTK_WINDOW(window));
}

int
main(int argc, char **argv)
{
    GtkApplication *app = gtk_application_new("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    int status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}

