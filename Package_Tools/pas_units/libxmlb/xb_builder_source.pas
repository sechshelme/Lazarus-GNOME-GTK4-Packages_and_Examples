unit xb_builder_source;

interface

uses
  fp_glib2, fp_xmlb, xb_builder_node, xb_builder_source_ctx, xb_builder_fixup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TXbBuilderSource = record
    parent_instance: TGObject;
  end;
  PXbBuilderSource = ^TXbBuilderSource;

  TXbBuilderSourceClass = record
    parent_class: TGObjectClass;
    _xb_reserved1: procedure; cdecl;
    _xb_reserved2: procedure; cdecl;
    _xb_reserved3: procedure; cdecl;
    _xb_reserved4: procedure; cdecl;
    _xb_reserved5: procedure; cdecl;
    _xb_reserved6: procedure; cdecl;
    _xb_reserved7: procedure; cdecl;
  end;
  PXbBuilderSourceClass = ^TXbBuilderSourceClass;

  PXbBuilderSourceFlags = ^TXbBuilderSourceFlags;
  TXbBuilderSourceFlags = longint;

const
  XB_BUILDER_SOURCE_FLAG_NONE = 0;
  XB_BUILDER_SOURCE_FLAG_LITERAL_TEXT = 1 shl 0;
  XB_BUILDER_SOURCE_FLAG_WATCH_FILE = 1 shl 1;
  XB_BUILDER_SOURCE_FLAG_WATCH_DIRECTORY = 1 shl 2;
  XB_BUILDER_SOURCE_FLAG_LAST = (1 shl 2) + 1;

type
  TXbBuilderSourceNodeFunc = function(self: PXbBuilderSource; bn: PXbBuilderNode; user_data: Tgpointer; error: PPGError): Tgboolean; cdecl;
  TXbBuilderSourceAdapterFunc = function(self: PXbBuilderSource; ctx: PXbBuilderSourceCtx; user_data: Tgpointer; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl;

function xb_builder_source_get_type: TGType; cdecl; external libxmlb;
function xb_builder_source_new: PXbBuilderSource; cdecl; external libxmlb;
function xb_builder_source_load_file(self: PXbBuilderSource; file_: PGFile; flags: TXbBuilderSourceFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libxmlb;
function xb_builder_source_load_xml(self: PXbBuilderSource; xml: Pgchar; flags: TXbBuilderSourceFlags; error: PPGError): Tgboolean; cdecl; external libxmlb;
function xb_builder_source_load_bytes(self: PXbBuilderSource; bytes: PGBytes; flags: TXbBuilderSourceFlags; error: PPGError): Tgboolean; cdecl; external libxmlb;
procedure xb_builder_source_set_info(self: PXbBuilderSource; info: PXbBuilderNode); cdecl; external libxmlb;
procedure xb_builder_source_set_prefix(self: PXbBuilderSource; prefix: Pgchar); cdecl; external libxmlb;
procedure xb_builder_source_add_fixup(self: PXbBuilderSource; fixup: PXbBuilderFixup); cdecl; external libxmlb;
procedure xb_builder_source_add_adapter(self: PXbBuilderSource; content_types: Pgchar; func: TXbBuilderSourceAdapterFunc; user_data: Tgpointer; user_data_free: TGDestroyNotify); cdecl; external libxmlb;
procedure xb_builder_source_add_simple_adapter(self: PXbBuilderSource; content_types: Pgchar; func: TXbBuilderSourceAdapterFunc; user_data: Tgpointer; user_data_free: TGDestroyNotify); cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:15 ===

function XB_TYPE_BUILDER_SOURCE: TGType;
function XB_BUILDER_SOURCE(obj: Pointer): PXbBuilderSource;
function XB_IS_BUILDER_SOURCE(obj: Pointer): Tgboolean;
function XB_BUILDER_SOURCE_CLASS(klass: Pointer): PXbBuilderSourceClass;
function XB_IS_BUILDER_SOURCE_CLASS(klass: Pointer): Tgboolean;
function XB_BUILDER_SOURCE_GET_CLASS(obj: Pointer): PXbBuilderSourceClass;

implementation

function XB_TYPE_BUILDER_SOURCE: TGType;
begin
  Result := xb_builder_source_get_type;
end;

function XB_BUILDER_SOURCE(obj: Pointer): PXbBuilderSource;
begin
  Result := PXbBuilderSource(g_type_check_instance_cast(obj, XB_TYPE_BUILDER_SOURCE));
end;

function XB_IS_BUILDER_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_BUILDER_SOURCE);
end;

function XB_BUILDER_SOURCE_CLASS(klass: Pointer): PXbBuilderSourceClass;
begin
  Result := PXbBuilderSourceClass(g_type_check_class_cast(klass, XB_TYPE_BUILDER_SOURCE));
end;

function XB_IS_BUILDER_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_BUILDER_SOURCE);
end;

function XB_BUILDER_SOURCE_GET_CLASS(obj: Pointer): PXbBuilderSourceClass;
begin
  Result := PXbBuilderSourceClass(PGTypeInstance(obj)^.g_class);
end;


end.
