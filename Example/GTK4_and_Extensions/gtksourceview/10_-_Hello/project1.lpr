program project1;

uses
  ctypes,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_pango,
  fp_gtksourceview;

const
  sample_code: Pgchar =
    ''#10 +
    '// Ein kleines C-Demo Programm'#10 +
    ''#10 +
    '// gcc -o main main.c'#10 +
    ''#10 +
    '#include <stdio.h>'#10 +
    ''#10 +
    'int main(int argc, char *argv[]) {'#10 +
    ''#10 +
    '    printf("Anzahl der Argumente: %d\n", argc);'#10 +
    ''#10 +
    '    for (int 0 = 1; i <= 15; i++)'#10 +
    '    {'#10 +
    '        printf("Zahl: %d\n", i);  // Ausgabe'#10 +
    '    }'#10 +
    ''#10 +
    '    return 0;'#10 +
    '}';

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, mainBox, scrolled_window, source_view: PGtkWidget;
    language_manager: PGtkSourceLanguageManager;
    language: PGtkSourceLanguage;
    source_buffer: PGtkSourceBuffer;
    style_manager: PGtkSourceStyleSchemeManager;
    style_scheme: PGtkSourceStyleScheme;
    provider: PGtkCssProvider;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 SourceView Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), mainBox);

    scrolled_window := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(GTK_WIDGET(scrolled_window), True);
    gtk_widget_set_hexpand(GTK_WIDGET(scrolled_window), True);
    gtk_box_append(GTK_BOX(mainBox), scrolled_window);


    language_manager := gtk_source_language_manager_get_default;
    language := gtk_source_language_manager_get_language(language_manager, 'c');
    source_buffer := gtk_source_buffer_new_with_language(language);

    // Setze ein Stil-Schema für die Syntaxhervorhebung
    style_manager := gtk_source_style_scheme_manager_get_default;
    style_scheme := gtk_source_style_scheme_manager_get_scheme(style_manager, 'tango');
    gtk_source_buffer_set_style_scheme(source_buffer, style_scheme);
    gtk_text_buffer_set_text(GTK_TEXT_BUFFER(source_buffer), sample_code, -1);

    // Erstelle die GtkSourceView
    source_view := gtk_source_view_new_with_buffer(source_buffer);
    gtk_source_view_set_show_line_numbers(GTK_SOURCE_VIEW(source_view), True);
    gtk_source_view_set_highlight_current_line(GTK_SOURCE_VIEW(source_view), True);
    gtk_source_view_set_auto_indent(GTK_SOURCE_VIEW(source_view), True);

    // Die Schrift auf Monospace setzen
    provider := gtk_css_provider_new();
    gtk_css_provider_load_from_string(provider, 'textview { font-family: monospace; }');
    gtk_style_context_add_provider_for_display(gdk_display_get_default(), GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);
    g_object_unref(provider);

    // Füge die GtkSourceView zum scrollbaren Fenster hinzu
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), source_view);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.sourceview.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
