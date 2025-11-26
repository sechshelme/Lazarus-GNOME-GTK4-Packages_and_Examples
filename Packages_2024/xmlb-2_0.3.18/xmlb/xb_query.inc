{$IFDEF read_interface}


type
  TXbQuery = record
    parent_instance: TGObject;
  end;
  PXbQuery = ^TXbQuery;

  TXbQueryClass = record
    parent_class: TGObjectClass;
    _xb_reserved1: procedure; cdecl;
    _xb_reserved2: procedure; cdecl;
    _xb_reserved3: procedure; cdecl;
    _xb_reserved4: procedure; cdecl;
    _xb_reserved5: procedure; cdecl;
    _xb_reserved6: procedure; cdecl;
    _xb_reserved7: procedure; cdecl;
  end;
  PXbQueryClass = ^TXbQueryClass;

  PXbQueryFlags = ^TXbQueryFlags;
  TXbQueryFlags = longint;

const
  XB_QUERY_FLAG_NONE = 0;
  XB_QUERY_FLAG_OPTIMIZE = 1 shl 0;
  XB_QUERY_FLAG_USE_INDEXES = 1 shl 1;
  XB_QUERY_FLAG_REVERSE = 1 shl 2;
  XB_QUERY_FLAG_FORCE_NODE_CACHE = 1 shl 3;
  XB_QUERY_FLAG_LAST = (1 shl 3) + 1;

function xb_query_get_type: TGType; cdecl; external libxmlb;
function xb_query_new(silo: PXbSilo; xpath: Pgchar; error: PPGError): PXbQuery; cdecl; external libxmlb;
function xb_query_new_full(silo: PXbSilo; xpath: Pgchar; flags: TXbQueryFlags; error: PPGError): PXbQuery; cdecl; external libxmlb;
function xb_query_get_xpath(self: PXbQuery): Pgchar; cdecl; external libxmlb;
function xb_query_get_limit(self: PXbQuery): Tguint; cdecl; external libxmlb; deprecated 'xb_query_context_get_limit';
procedure xb_query_set_limit(self: PXbQuery; limit: Tguint); cdecl; external libxmlb; deprecated'xb_query_context_set_limit';
function xb_query_get_flags(self: PXbQuery): TXbQueryFlags; cdecl; external libxmlb; deprecated'xb_query_context_get_flags';
procedure xb_query_set_flags(self: PXbQuery; flags: TXbQueryFlags); cdecl; external libxmlb; deprecated'xb_query_context_set_flags';
function xb_query_bind_str(self: PXbQuery; idx: Tguint; str: Pgchar; error: PPGError): Tgboolean; cdecl; external libxmlb; deprecated'xb_value_bindings_bind_str';
function xb_query_bind_val(self: PXbQuery; idx: Tguint; val: Tguint32; error: PPGError): Tgboolean; cdecl; external libxmlb; deprecated'xb_value_bindings_bind_val';

// === Konventiert am: 1-10-25 19:42:34 ===

function XB_TYPE_QUERY: TGType;
function XB_QUERY(obj: Pointer): PXbQuery;
function XB_IS_QUERY(obj: Pointer): Tgboolean;
function XB_QUERY_CLASS(klass: Pointer): PXbQueryClass;
function XB_IS_QUERY_CLASS(klass: Pointer): Tgboolean;
function XB_QUERY_GET_CLASS(obj: Pointer): PXbQueryClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XB_TYPE_QUERY: TGType;
begin
  Result := xb_query_get_type;
end;

function XB_QUERY(obj: Pointer): PXbQuery;
begin
  Result := PXbQuery(g_type_check_instance_cast(obj, XB_TYPE_QUERY));
end;

function XB_IS_QUERY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_QUERY);
end;

function XB_QUERY_CLASS(klass: Pointer): PXbQueryClass;
begin
  Result := PXbQueryClass(g_type_check_class_cast(klass, XB_TYPE_QUERY));
end;

function XB_IS_QUERY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_QUERY);
end;

function XB_QUERY_GET_CLASS(obj: Pointer): PXbQueryClass;
begin
  Result := PXbQueryClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
