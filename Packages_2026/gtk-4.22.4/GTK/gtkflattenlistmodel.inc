

  {$IFDEF read_struct}
type
  PGtkFlattenListModel = type Pointer;

  TGtkFlattenListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFlattenListModelClass = ^TGtkFlattenListModelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_flatten_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_flatten_list_model_new(model: PGListModel): PGtkFlattenListModel; cdecl; external libgtk4;
procedure gtk_flatten_list_model_set_model(self: PGtkFlattenListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_flatten_list_model_get_model(self: PGtkFlattenListModel): PGListModel; cdecl; external libgtk4;
function gtk_flatten_list_model_get_model_for_item(self: PGtkFlattenListModel; position: Tguint): PGListModel; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:40 ===

function GTK_TYPE_FLATTEN_LIST_MODEL: TGType;
function GTK_FLATTEN_LIST_MODEL(obj: Pointer): PGtkFlattenListModel;
function GTK_IS_FLATTEN_LIST_MODEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FLATTEN_LIST_MODEL: TGType;
begin
  Result := gtk_flatten_list_model_get_type;
end;

function GTK_FLATTEN_LIST_MODEL(obj: Pointer): PGtkFlattenListModel;
begin
  Result := PGtkFlattenListModel(g_type_check_instance_cast(obj, GTK_TYPE_FLATTEN_LIST_MODEL));
end;

function GTK_IS_FLATTEN_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FLATTEN_LIST_MODEL);
end;

{$ENDIF read_implementation}
