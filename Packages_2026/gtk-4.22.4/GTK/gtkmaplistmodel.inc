

  {$IFDEF read_struct}
type
  TGtkMapListModelMapFunc = function(item: Tgpointer; user_data: Tgpointer): Tgpointer; cdecl;

  PGtkMapListModel = type Pointer;

  TGtkMapListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkMapListModelClass = ^TGtkMapListModelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_map_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_map_list_model_new(model: PGListModel; map_func: TGtkMapListModelMapFunc; user_data: Tgpointer; user_destroy: TGDestroyNotify): PGtkMapListModel; cdecl; external libgtk4;
procedure gtk_map_list_model_set_map_func(self: PGtkMapListModel; map_func: TGtkMapListModelMapFunc; user_data: Tgpointer; user_destroy: TGDestroyNotify); cdecl; external libgtk4;
procedure gtk_map_list_model_set_model(self: PGtkMapListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_map_list_model_get_model(self: PGtkMapListModel): PGListModel; cdecl; external libgtk4;
function gtk_map_list_model_has_map(self: PGtkMapListModel): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:45:30 ===

function GTK_TYPE_MAP_LIST_MODEL: TGType;
function GTK_MAP_LIST_MODEL(obj: Pointer): PGtkMapListModel;
function GTK_IS_MAP_LIST_MODEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_MAP_LIST_MODEL: TGType;
begin
  Result := gtk_map_list_model_get_type;
end;

function GTK_MAP_LIST_MODEL(obj: Pointer): PGtkMapListModel;
begin
  Result := PGtkMapListModel(g_type_check_instance_cast(obj, GTK_TYPE_MAP_LIST_MODEL));
end;

function GTK_IS_MAP_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MAP_LIST_MODEL);
end;

{$ENDIF read_implementation}
