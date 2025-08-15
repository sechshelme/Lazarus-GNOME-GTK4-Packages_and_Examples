program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

const
  LabelText = 'Ich bin ein wirklich übergrosses endloses Label, das nicht hören will !';

  // ========================

  function CreateEntryBox: PGtkWidget;
  var
    entry: PGtkWidget;
    buffer: PGtkEntryBuffer;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    buffer := gtk_entry_buffer_new(LabelText, -1);

    entry := gtk_entry_new;
    gtk_entry_set_buffer(GTK_ENTRY(entry), buffer);
    gtk_widget_set_hexpand(entry, True);

    gtk_box_append(GTK_BOX(Result), entry);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, box: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    gtk_box_append(GTK_BOX(box), CreateEntryBox);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.

(*

// gcc main.c -o main `pkg-config --cflags --libs gtk4 poppler-glib`

#include <gtk/gtk.h>
#include <poppler.h>

static PopplerDocument *document = NULL;
static PopplerPage *page = NULL;

// Draw-Callback für die DrawingArea
static void draw_event(GtkDrawingArea *area, cairo_t *cr, int width, int height, gpointer user_data) {
    if (!page)
        return;

    // Weißer Hintergrund
    cairo_set_source_rgb(cr, 1, 1, 1);
    cairo_paint(cr);

    // Natürliche Seitengröße der PDF-Seite
    double pdf_width, pdf_height;
    poppler_page_get_size(page, &pdf_width, &pdf_height);

    // Maßstab berechnen, um Seite an DrawingArea anzupassen (proportional skalieren)
    double scale_x = (double)width / pdf_width;
    double scale_y = (double)height / pdf_height;
    double scale = (scale_x < scale_y) ? scale_x : scale_y;

    // Skalierung anwenden
    cairo_scale(cr, scale, scale);

    // PDF-Seite rendern
    poppler_page_render(page, cr);
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Poppler + GTK4 PDF Viewer");
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 800);

    GtkWidget *drawing_area = gtk_drawing_area_new();
    gtk_window_set_child(GTK_WINDOW(window), drawing_area);

    // Callback zum Zeichnen verbinden
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(drawing_area), (GtkDrawingAreaDrawFunc) draw_event, NULL, NULL);

gtk_window_present(GTK_WINDOW(window));
}

int main(int argc, char **argv) {
//    if (argc < 2) {
//        g_printerr("Usage: %s /path/to/file.pdf\n", argv[0]);
//        return 1;
//    }

    GError *error = NULL;
    gchar *path_uri = g_filename_to_uri("/home/tux/Downloads/1553760606.pdf", NULL, &error);
    if (!path_uri) {
        g_printerr("Error creating URI from path: %s\n", error->message);
        g_error_free(error);
        return 1;
    }

    // PDF-Dokument laden
    document = poppler_document_new_from_file(path_uri, NULL, &error);
    g_free(path_uri);

    if (!document) {
        g_printerr("Error loading PDF document: %s\n", error->message);
        g_error_free(error);
        return 1;
    }

    // Erste Seite laden
    page = poppler_document_get_page(document, 2);
    if (!page) {
        g_printerr("Error loading first page\n");
        g_object_unref(document);
        return 1;
    }

    GtkApplication *app = gtk_application_new("org.example.popplergtk", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);

    int status = g_application_run(G_APPLICATION(app), argc, argv);

    g_object_unref(page);
    g_object_unref(document);
    g_object_unref(app);

    return status;
}

*)

