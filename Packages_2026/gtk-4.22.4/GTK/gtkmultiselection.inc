

  {$IFDEF read_struct}
type
  PGtkMultiSelection = type Pointer;

  TGtkMultiSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkMultiSelectionClass = ^TGtkMultiSelectionClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_multi_selection_get_type: TGType; cdecl; external libgtk4;
function gtk_multi_selection_new(model: PGListModel): PGtkMultiSelection; cdecl; external libgtk4;
function gtk_multi_selection_get_model(self: PGtkMultiSelection): PGListModel; cdecl; external libgtk4;
procedure gtk_multi_selection_set_model(self: PGtkMultiSelection; model: PGListModel); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:18:22 ===

function GTK_TYPE_MULTI_SELECTION: TGType;
function GTK_MULTI_SELECTION(obj: Pointer): PGtkMultiSelection;
function GTK_IS_MULTI_SELECTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}


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
