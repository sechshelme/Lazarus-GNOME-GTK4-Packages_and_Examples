


  {$IFDEF read_struct}
type
  PGtkSliceListModel = type Pointer;

  TGtkSliceListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSliceListModelClass = ^TGtkSliceListModelClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_slice_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_slice_list_model_new(model: PGListModel; offset: Tguint; size: Tguint): PGtkSliceListModel; cdecl; external libgtk4;
procedure gtk_slice_list_model_set_model(self: PGtkSliceListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_slice_list_model_get_model(self: PGtkSliceListModel): PGListModel; cdecl; external libgtk4;
procedure gtk_slice_list_model_set_offset(self: PGtkSliceListModel; offset: Tguint); cdecl; external libgtk4;
function gtk_slice_list_model_get_offset(self: PGtkSliceListModel): Tguint; cdecl; external libgtk4;
procedure gtk_slice_list_model_set_size(self: PGtkSliceListModel; size: Tguint); cdecl; external libgtk4;
function gtk_slice_list_model_get_size(self: PGtkSliceListModel): Tguint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:00:07 ===

function GTK_TYPE_SLICE_LIST_MODEL: TGType;
function GTK_SLICE_LIST_MODEL(obj: Pointer): PGtkSliceListModel;
function GTK_IS_SLICE_LIST_MODEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SLICE_LIST_MODEL: TGType;
begin
  Result := gtk_slice_list_model_get_type;
end;

function GTK_SLICE_LIST_MODEL(obj: Pointer): PGtkSliceListModel;
begin
  Result := PGtkSliceListModel(g_type_check_instance_cast(obj, GTK_TYPE_SLICE_LIST_MODEL));
end;

function GTK_IS_SLICE_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SLICE_LIST_MODEL);
end;

{$ENDIF read_implementation}
