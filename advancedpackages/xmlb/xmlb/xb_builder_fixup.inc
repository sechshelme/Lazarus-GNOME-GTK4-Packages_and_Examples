{$IFDEF read_interface}


type
  TXbBuilderFixup = record
    parent_instance: TGObject;
  end;
  PXbBuilderFixup = ^TXbBuilderFixup;

  TXbBuilderFixupClass = record
    parent_class: TGObjectClass;
    _xb_reserved1: procedure; cdecl;
    _xb_reserved2: procedure; cdecl;
    _xb_reserved3: procedure; cdecl;
    _xb_reserved4: procedure; cdecl;
    _xb_reserved5: procedure; cdecl;
    _xb_reserved6: procedure; cdecl;
    _xb_reserved7: procedure; cdecl;
  end;
  PXbBuilderFixupClass = ^TXbBuilderFixupClass;

  TXbBuilderFixupFunc = function(self: PXbBuilderFixup; bn: PXbBuilderNode; user_data: Tgpointer; error: PPGError): Tgboolean; cdecl;

function xb_builder_fixup_get_type: TGType; cdecl; external libxmlb;
function xb_builder_fixup_new(id: Pgchar; func: TXbBuilderFixupFunc; user_data: Tgpointer; user_data_free: TGDestroyNotify): PXbBuilderFixup; cdecl; external libxmlb;
function xb_builder_fixup_get_max_depth(self: PXbBuilderFixup): Tgint; cdecl; external libxmlb;
procedure xb_builder_fixup_set_max_depth(self: PXbBuilderFixup; max_depth: Tgint); cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:07 ===

function XB_TYPE_BUILDER_FIXUP: TGType;
function XB_BUILDER_FIXUP(obj: Pointer): PXbBuilderFixup;
function XB_IS_BUILDER_FIXUP(obj: Pointer): Tgboolean;
function XB_BUILDER_FIXUP_CLASS(klass: Pointer): PXbBuilderFixupClass;
function XB_IS_BUILDER_FIXUP_CLASS(klass: Pointer): Tgboolean;
function XB_BUILDER_FIXUP_GET_CLASS(obj: Pointer): PXbBuilderFixupClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XB_TYPE_BUILDER_FIXUP: TGType;
begin
  Result := xb_builder_fixup_get_type;
end;

function XB_BUILDER_FIXUP(obj: Pointer): PXbBuilderFixup;
begin
  Result := PXbBuilderFixup(g_type_check_instance_cast(obj, XB_TYPE_BUILDER_FIXUP));
end;

function XB_IS_BUILDER_FIXUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_BUILDER_FIXUP);
end;

function XB_BUILDER_FIXUP_CLASS(klass: Pointer): PXbBuilderFixupClass;
begin
  Result := PXbBuilderFixupClass(g_type_check_class_cast(klass, XB_TYPE_BUILDER_FIXUP));
end;

function XB_IS_BUILDER_FIXUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_BUILDER_FIXUP);
end;

function XB_BUILDER_FIXUP_GET_CLASS(obj: Pointer): PXbBuilderFixupClass;
begin
  Result := PXbBuilderFixupClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
