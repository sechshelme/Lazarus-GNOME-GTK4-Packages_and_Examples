
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkMultiSelection, gtk_multi_selection, GTK, MULTI_SELECTION, GObject) }
type
  TGtkMultiSelection = record
  end;
  PGtkMultiSelection = ^TGtkMultiSelection;

  TGtkMultiSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkMultiSelectionClass = ^TGtkMultiSelectionClass;

function gtk_multi_selection_get_type: TGType; cdecl; external libgtk4;
function gtk_multi_selection_new(model: PGListModel): PGtkMultiSelection; cdecl; external libgtk4;
function gtk_multi_selection_get_model(self: PGtkMultiSelection): PGListModel; cdecl; external libgtk4;
procedure gtk_multi_selection_set_model(self: PGtkMultiSelection; model: PGListModel); cdecl; external libgtk4;

// === Konventiert am: 28-7-24 13:38:10 ===

function GTK_TYPE_MULTI_SELECTION: TGType;
function GTK_MULTI_SELECTION(obj: Pointer): PGtkMultiSelection;
function GTK_IS_MULTI_SELECTION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_MULTI_SELECTION: TGType;
begin
  Result := gtk_multi_selection_get_type;
end;

function GTK_MULTI_SELECTION(obj: Pointer): PGtkMultiSelection;
begin
  Result := PGtkMultiSelection(g_type_check_instance_cast(obj, GTK_TYPE_MULTI_SELECTION));
end;

function GTK_IS_MULTI_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MULTI_SELECTION);
end;




{$ENDIF read_implementation}
