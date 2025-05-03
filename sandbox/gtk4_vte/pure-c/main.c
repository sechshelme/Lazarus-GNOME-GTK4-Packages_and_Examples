
// gcc -o main main.c `pkg-config --cflags --libs vte-2.91-gtk4`

// https://www.perplexity.ai/search/kann-ich-ein-xterm-in-meine-an-ehKtKDI7T.yalg3yYJX5og


#include <gtk/gtk.h>
#include <vte/vte.h>

static void
activate(GtkApplication *app, gpointer user_data)
{
    GtkWidget *window;
    GtkWidget *terminal;
    GtkWidget *scrolled_window;

    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "VTE Terminal (GTK4)");
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    scrolled_window = gtk_scrolled_window_new();
    gtk_window_set_child(GTK_WINDOW(window), scrolled_window);

    terminal = vte_terminal_new();
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), terminal);

//    char *argv[] = { "/bin/bash", NULL };
    char *argv[] = { "/bin/fp", NULL };

    vte_terminal_spawn_async(
        VTE_TERMINAL(terminal),
        VTE_PTY_DEFAULT,
        NULL,           // Arbeitsverzeichnis (NULL = Standard)
        argv,           // Kommandozeilenargumente
        NULL,           // Umgebungsvariablen (NULL = erben)
        G_SPAWN_DEFAULT,
        NULL,           // child_setup callback
        NULL,           // child_setup_data
        NULL,           // child_setup_data_destroy
        -1,             // Timeout (Standard)
        NULL,           // cancellable
        NULL,           // callback
        NULL            // user_data
    );

    // Fenster anzeigen (GTK4-empfohlen)
    gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv)
{
    GtkApplication *app;
    int status;

    app = gtk_application_new("org.example.vteterm", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}

