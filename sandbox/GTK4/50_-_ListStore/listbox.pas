unit ListBox;

{$modeswitch typehelpers on}
{$modeswitch arrayoperators on}
//{$modeswitch multihelpers}
{$modeswitch advancedrecords on}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBoxWidget: PGtkWidget;

implementation

// https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-gtk-l-3L_FREJyTXiqn2vNyH76Kw

function Create_ListBoxWidget: PGtkWidget;
var
  i: integer;
  lb, sw: PGtkWidget;
  listStore: PGtkListStore;
  iter: TGtkTreeIter;
begin
  sw := gtk_scrolled_window_new;
  gtk_widget_set_vexpand(sw, True);


  listStore := gtk_list_store_new(3, G_TYPE_STRING, G_TYPE_STRING, G_TYPE_INT);

  gtk_list_store_append(listStore, @iter);
  gtk_list_store_set(listStore, @iter, 0, 'Max',1,'Mustermann', 2, 30, -1);

  gtk_list_store_append(listStore, @iter);
  gtk_list_store_set(listStore, @iter, 0, 'Hans',1,'Maier', 2, 30, -1);

  gtk_list_store_append(listStore, @iter);
  gtk_list_store_set(listStore, @iter, 0, 'Hans',1,'Maier', 2, 30, -1);


lb:=gtk_tree_view_new_with_model(GTK_TREE_MODEL(listStore));

  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), lb);

  Result := sw;
end;




end.
