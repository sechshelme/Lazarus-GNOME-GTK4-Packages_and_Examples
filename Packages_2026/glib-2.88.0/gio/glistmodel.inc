

  {$IFDEF read_struct}
type
  PGListModel = type Pointer;

  PGListModelInterface = ^TGListModelInterface;
  TGListModelInterface = record
    g_iface: TGTypeInterface;
    get_item_type: function(list: PGListModel): TGType; cdecl;
    get_n_items: function(list: PGListModel): Tguint; cdecl;
    get_item: function(list: PGListModel; position: Tguint): Tgpointer; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_list_model_get_type: TGType; cdecl; external libgio2;
function g_list_model_get_item_type(list: PGListModel): TGType; cdecl; external libgio2;
function g_list_model_get_n_items(list: PGListModel): Tguint; cdecl; external libgio2;
function g_list_model_get_item(list: PGListModel; position: Tguint): Tgpointer; cdecl; external libgio2;
function g_list_model_get_object(list: PGListModel; position: Tguint): PGObject; cdecl; external libgio2;
procedure g_list_model_items_changed(list: PGListModel; position: Tguint; removed: Tguint; added: Tguint); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:39:59 ===

function G_TYPE_LIST_MODEL: TGType;
function G_LIST_MODEL(obj: Pointer): PGListModel;
function G_IS_LIST_MODEL(obj: Pointer): Tgboolean;
function G_LIST_MODEL_GET_IFACE(obj: Pointer): PGListModelInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_LIST_MODEL: TGType;
begin
  Result := g_list_model_get_type;
end;

function G_LIST_MODEL(obj: Pointer): PGListModel;
begin
  Result := PGListModel(g_type_check_instance_cast(obj, G_TYPE_LIST_MODEL));
end;

function G_IS_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LIST_MODEL);
end;

function G_LIST_MODEL_GET_IFACE(obj: Pointer): PGListModelInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_LIST_MODEL);
end;

{$ENDIF read_implementation}
