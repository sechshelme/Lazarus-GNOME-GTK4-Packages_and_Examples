// https://gitlab.gnome.org/GNOME/gtk/-/blob/master/tests/simple.c
// gcc -Wall simple.c -o simple `pkg-config --cflags --libs gtk4`

// https://discourse.gnome.org/t/gtk4-tests-simple-c-program-does-not-terminate-when-closing-window-with-nim-bindings/3547

#include <gtk/gtk.h>
#include <X11/X.h>
#include <X11/X.h>
#include <X11//Intrinsic.h>
#include <X11//IntrinsicP.h>
#include <X11//IntrinsicI.h>

static void
hello (void)
{
  g_print ("hello world\n");
}

static void
quit_cb (GtkWidget *widget,
         gpointer   data)
{
  gboolean *done = data;
  *done = TRUE;
  g_main_context_wakeup (NULL);
}

int
main (int argc, char *argv[])
{
  GtkWidget *window, *button;
  gboolean done = FALSE;
  gtk_init ();
  window = gtk_window_new ();
  g_object_ref_sink(window); // added by salewski for testing
  gtk_window_set_title (GTK_WINDOW (window), "hello world");
  gtk_window_set_resizable (GTK_WINDOW (window), FALSE);
  g_signal_connect (window, "destroy", G_CALLBACK (quit_cb), &done);
  button = gtk_button_new ();
  gtk_button_set_label (GTK_BUTTON (button), "hello world\nHallo Welt");
  gtk_widget_set_margin_top (button, 100);
  gtk_widget_set_margin_bottom (button, 100);
  gtk_widget_set_margin_start (button, 100);
  gtk_widget_set_margin_end (button, 100);
  g_signal_connect (button, "clicked", G_CALLBACK (hello), NULL);
  gtk_window_set_child (GTK_WINDOW (window), button);
  gtk_widget_show (window);
  while (!done)
    g_main_context_iteration (NULL, TRUE);
  return 0;

  G_TYPE_STRING
}
Cardinal
