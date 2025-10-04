{$IFDEF read_interface}


type
  TXbBuilder = record
    parent_instance: TGObject;
  end;
  PXbBuilder = ^TXbBuilder;

  TXbBuilderClass = record
    parent_class: TGObjectClass;
    _xb_reserved1: procedure; cdecl;
    _xb_reserved2: procedure; cdecl;
    _xb_reserved3: procedure; cdecl;
    _xb_reserved4: procedure; cdecl;
    _xb_reserved5: procedure; cdecl;
    _xb_reserved6: procedure; cdecl;
    _xb_reserved7: procedure; cdecl;
  end;
  PXbBuilderClass = ^TXbBuilderClass;

  PXbBuilderCompileFlags = ^TXbBuilderCompileFlags;
  TXbBuilderCompileFlags = longint;

const
  XB_BUILDER_COMPILE_FLAG_NONE = 0;
  XB_BUILDER_COMPILE_FLAG_NATIVE_LANGS = 1 shl 1;
  XB_BUILDER_COMPILE_FLAG_IGNORE_INVALID = 1 shl 2;
  XB_BUILDER_COMPILE_FLAG_SINGLE_LANG = 1 shl 3;
  XB_BUILDER_COMPILE_FLAG_WATCH_BLOB = 1 shl 4;
  XB_BUILDER_COMPILE_FLAG_IGNORE_GUID = 1 shl 5;
  XB_BUILDER_COMPILE_FLAG_SINGLE_ROOT = 1 shl 6;
  XB_BUILDER_COMPILE_FLAG_LAST = (1 shl 6) + 1;

function xb_builder_get_type: TGType; cdecl; external libxmlb;
function xb_builder_new: PXbBuilder; cdecl; external libxmlb;
procedure xb_builder_append_guid(self: PXbBuilder; guid: Pgchar); cdecl; external libxmlb;
procedure xb_builder_import_source(self: PXbBuilder; source: PXbBuilderSource); cdecl; external libxmlb;
procedure xb_builder_import_node(self: PXbBuilder; bn: PXbBuilderNode); cdecl; external libxmlb;
function xb_builder_compile(self: PXbBuilder; flags: TXbBuilderCompileFlags; cancellable: PGCancellable; error: PPGError): PXbSilo; cdecl; external libxmlb;
function xb_builder_ensure(self: PXbBuilder; file_: PGFile; flags: TXbBuilderCompileFlags; cancellable: PGCancellable; error: PPGError): PXbSilo; cdecl; external libxmlb;
procedure xb_builder_add_locale(self: PXbBuilder; locale: Pgchar); cdecl; external libxmlb;
procedure xb_builder_add_fixup(self: PXbBuilder; fixup: PXbBuilderFixup); cdecl; external libxmlb;
procedure xb_builder_set_profile_flags(self: PXbBuilder; profile_flags: TXbSiloProfileFlags); cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:03 ===

function XB_TYPE_BUILDER: TGType;
function XB_BUILDER(obj: Pointer): PXbBuilder;
function XB_IS_BUILDER(obj: Pointer): Tgboolean;
function XB_BUILDER_CLASS(klass: Pointer): PXbBuilderClass;
function XB_IS_BUILDER_CLASS(klass: Pointer): Tgboolean;
function XB_BUILDER_GET_CLASS(obj: Pointer): PXbBuilderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XB_TYPE_BUILDER: TGType;
begin
  Result := xb_builder_get_type;
end;

function XB_BUILDER(obj: Pointer): PXbBuilder;
begin
  Result := PXbBuilder(g_type_check_instance_cast(obj, XB_TYPE_BUILDER));
end;

function XB_IS_BUILDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_BUILDER);
end;

function XB_BUILDER_CLASS(klass: Pointer): PXbBuilderClass;
begin
  Result := PXbBuilderClass(g_type_check_class_cast(klass, XB_TYPE_BUILDER));
end;

function XB_IS_BUILDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_BUILDER);
end;

function XB_BUILDER_GET_CLASS(obj: Pointer): PXbBuilderClass;
begin
  Result := PXbBuilderClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
