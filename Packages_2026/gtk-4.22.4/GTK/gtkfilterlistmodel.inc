

  {$IFDEF read_struct}
type
  PGtkFilterListModel = type Pointer;

  TGtkFilterListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFilterListModelClass = ^TGtkFilterListModelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_filter_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_filter_list_model_new(model: PGListModel; filter: PGtkFilter): PGtkFilterListModel; cdecl; external libgtk4;
procedure gtk_filter_list_model_set_filter(self: PGtkFilterListModel; filter: PGtkFilter); cdecl; external libgtk4;
function gtk_filter_list_model_get_filter(self: PGtkFilterListModel): PGtkFilter; cdecl; external libgtk4;
procedure gtk_filter_list_model_set_model(self: PGtkFilterListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_filter_list_model_get_model(self: PGtkFilterListModel): PGListModel; cdecl; external libgtk4;
procedure gtk_filter_list_model_set_incremental(self: PGtkFilterListModel; incremental: Tgboolean); cdecl; external libgtk4;
function gtk_filter_list_model_get_incremental(self: PGtkFilterListModel): Tgboolean; cdecl; external libgtk4;
function gtk_filter_list_model_get_pending(self: PGtkFilterListModel): Tguint; cdecl; external libgtk4;
function gtk_filter_list_model_get_watch_items(self: PGtkFilterListModel): Tgboolean; cdecl; external libgtk4;
procedure gtk_filter_list_model_set_watch_items(self: PGtkFilterListModel; watch_items: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:55:54 ===

function GTK_TYPE_FILTER_LIST_MODEL: TGType;
function GTK_FILTER_LIST_MODEL(obj: Pointer): PGtkFilterListModel;
function GTK_IS_FILTER_LIST_MODEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FILTER_LIST_MODEL: TGType;
begin
  Result := gtk_filter_list_model_get_type;
end;

function GTK_FILTER_LIST_MODEL(obj: Pointer): PGtkFilterListModel;
begin
  Result := PGtkFilterListModel(g_type_check_instance_cast(obj, GTK_TYPE_FILTER_LIST_MODEL));
end;

function GTK_IS_FILTER_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILTER_LIST_MODEL);
end;

{$ENDIF read_implementation}
