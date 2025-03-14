
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSliceListModel, gtk_slice_list_model, GTK, SLICE_LIST_MODEL, GObject) }
type
  TGtkSliceListModel = record
  end;
  PGtkSliceListModel = ^TGtkSliceListModel;

  TGtkSliceListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSliceListModelClass = ^TGtkSliceListModelClass;

function gtk_slice_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_slice_list_model_new(model: PGListModel; offset: Tguint; size: Tguint): PGtkSliceListModel; cdecl; external libgtk4;
procedure gtk_slice_list_model_set_model(self: PGtkSliceListModel; model: PGListModel); cdecl; external libgtk4;
function gtk_slice_list_model_get_model(self: PGtkSliceListModel): PGListModel; cdecl; external libgtk4;
procedure gtk_slice_list_model_set_offset(self: PGtkSliceListModel; offset: Tguint); cdecl; external libgtk4;
function gtk_slice_list_model_get_offset(self: PGtkSliceListModel): Tguint; cdecl; external libgtk4;
procedure gtk_slice_list_model_set_size(self: PGtkSliceListModel; size: Tguint); cdecl; external libgtk4;
function gtk_slice_list_model_get_size(self: PGtkSliceListModel): Tguint; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 16:33:16 ===

function GTK_TYPE_SLICE_LIST_MODEL: TGType;
function GTK_SLICE_LIST_MODEL(obj: Pointer): PGtkSliceListModel;
function GTK_IS_SLICE_LIST_MODEL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


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
