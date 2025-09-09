library plugin_pas;

{$mode objfpc}{$H+}

uses
  fp_glib2,
  fp_GTK4;

type
  TMyWidgets = record
    toolbar,
    text_view: PGtkWidget;
  end;
  PMyWidgets = ^TMyWidgets;

  procedure on_button_clicked(w: PGtkWidget; user_data: Pointer);
  begin
    g_print('Zusatz PAS wurde gedrückt!'#10);
  end;

  procedure Plugin_init_PAS(w: PMyWidgets);
  var
    button: PGtkWidget;
  begin
    g_print('Plugin_pas wird geladen!'#10);
    button := gtk_button_new_with_label('Zusatz PAS');
    g_signal_connect(button, 'clicked', G_CALLBACK(@on_button_clicked), nil);
    gtk_box_append(GTK_BOX(w^.toolbar), button);
    gtk_widget_set_visible(button, True);
  end;

exports
  Plugin_init_PAS;


begin

end.
