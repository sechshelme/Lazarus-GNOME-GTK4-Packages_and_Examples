unit ListBox;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBox: PGtkWidget;

implementation

// https://www.perplexity.ai/search/ich-wil-ein-gtk4-c-beispiel-mi-aSQTlKtOTC.HwTMdCeV2qw
// https://www.perplexity.ai/search/ich-will-in-gtk4-und-c-ein-lab-y_UYMrwvS829ak21s7tWPw

function CreateMenu: PGtkPopoverMenu;
var
  menu: PGMenu;
begin
  menu := g_menu_new;
  g_menu_append(menu, 'Option 1', 'app.option1');
  g_menu_append(menu, 'Option 2', 'app.option2');

  Result := GTK_POPOVER_MENU(gtk_popover_menu_new_from_model(G_MENU_MODEL(menu)));
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

procedure btn_item_click_cp({%H-}widget: PGtkWidget; Data: Tgpointer); cdecl;
var
  info: Pgchar absolute Data;
begin
  g_printf('Es wurde geklick: %s'#10, info);
end;

procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
var
  popover: PGtkPopover absolute Data;
begin
  WriteLn('listbox menu');
  gtk_popover_popup(GTK_POPOVER(popover));
end;



function Create_Items(nr: integer): PGtkWidget;
var
  lb, menuButton, button_align, popover, popover_box, item1, item2, item3: PGtkWidget;
  label_text: Pgchar;
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

  menuButton := gtk_button_new_with_label('•••');
  gtk_widget_set_size_request(menuButton, -1, 20);
  gtk_widget_set_valign(menuButton, GTK_ALIGN_CENTER);

  popover := gtk_popover_new;
  gtk_widget_set_parent(popover, menuButton);

  popover_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_popover_set_child(GTK_POPOVER(popover), popover_box);

  item1 := gtk_button_new_with_label('Option 1');
  g_signal_connect(item1, 'clicked', G_CALLBACK(@btn_item_click_cp), Pgchar('Option 1'));
  gtk_box_append(GTK_BOX(popover_box), item1);

  item2 := gtk_button_new_with_label('Option 2');
  g_signal_connect(item2, 'clicked', G_CALLBACK(@btn_item_click_cp), Pgchar('Option 2'));
  gtk_box_append(GTK_BOX(popover_box), item2);

  item3 := gtk_button_new_with_label('Option 3');
  g_signal_connect(item3, 'clicked', G_CALLBACK(@btn_item_click_cp), Pgchar('Option 3'));
  gtk_box_append(GTK_BOX(popover_box), item3);

  g_signal_connect(menuButton, 'clicked', G_CALLBACK(@btn_click_cp), popover);

  gtk_box_append(GTK_BOX(button_align), menuButton);
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


  for i := 0 to 5 do begin
    gtk_list_box_append(GTK_LIST_BOX(lb), Create_Items(i));
  end;
  Result := sw;
end;




end.
