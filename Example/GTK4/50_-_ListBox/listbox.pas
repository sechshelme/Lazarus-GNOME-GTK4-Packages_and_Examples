unit ListBox;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBox: PGtkWidget;

implementation

// https://www.perplexity.ai/search/ich-wil-ein-gtk4-c-beispiel-mi-aSQTlKtOTC.HwTMdCeV2qw
// https://www.perplexity.ai/search/ich-will-in-gtk4-und-c-ein-lab-y_UYMrwvS829ak21s7tWPw

function CreateMenu:PGMenu;
begin
  Result:=g_menu_new;
  g_menu_append(Result, 'Option 1', 'app.option1');
  g_menu_append(Result, 'Option 2', 'app.option2');
end;

function CreateButton(Caption: Pgchar): PGtkWidget;
begin
  Result := gtk_button_new_with_label(Caption);
  gtk_widget_set_margin_start(Result, 5);
  gtk_widget_set_margin_top(Result, 5);
  gtk_widget_set_margin_bottom(Result, 5);
  gtk_widget_set_margin_end(Result, 5);
end;

function CreateLabel(Caption: Pgchar): PGtkWidget;
begin
  Result := gtk_label_new(Caption);
end;

function Create_Items(nr: integer): PGtkWidget;
var
  lb, btn, button_align: PGtkWidget;
  label_text: Pgchar;
  menu: PGMenu;
begin
  Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  gtk_widget_set_hexpand(Result, True);

  label_text := g_strdup_printf('Eintrag: %d'#10 +
    '<span foreground="blue">Erste Zeile</span>'#10 +
    '<span foreground="black"><b>Zweite Zeile</b></span>'#10 +
    '<span foreground="gray">Dritte Zeile</span>', nr);

  lb := gtk_label_new(nil);
  gtk_label_set_markup(GTK_LABEL(lb), label_text);
  g_free(label_text);
  gtk_box_append(GTK_BOX(Result), lb);

  button_align := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  gtk_widget_set_hexpand(button_align, True);
  gtk_widget_set_halign(button_align, GTK_ALIGN_END);

  btn := gtk_button_new_with_label('•••');
  gtk_widget_set_size_request(btn, -1, 20);
  gtk_widget_set_valign(btn, GTK_ALIGN_CENTER);

  menu:=CreateMenu;;
  gtk_menu_button_set_menu_model(GTK_MENU_BUTTON(btn), G_MENU_MODEL(menu));

  gtk_box_append(GTK_BOX(button_align), btn);




  gtk_box_append(GTK_BOX(Result), button_align);
end;

function Create_ListBox: PGtkWidget;
var
  i: integer;
  lb, sw: PGtkWidget;
begin
  sw := gtk_scrolled_window_new;
  gtk_widget_set_vexpand(sw, True);

  lb := gtk_list_box_new;
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), lb);


  for i := 0 to 20 do begin
    gtk_list_box_append(GTK_LIST_BOX(lb), Create_Items(i));
  end;
  Result := sw;
end;




end.
