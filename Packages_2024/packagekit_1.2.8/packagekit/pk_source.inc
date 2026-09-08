{$IFDEF read_interface}


type
  PPkSourcePrivate = type Pointer;

  PPkSource = ^TPkSource;
  TPkSource = record
    parent: TGObject;
    priv: PPkSourcePrivate;
  end;

  PPkSourceClass = ^TPkSourceClass;
  TPkSourceClass = record
    parent_class: TGObjectClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_source_get_type: TGType; cdecl; external libpackagekit;
function pk_source_new: PPkSource; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:13:42 ===

function PK_TYPE_SOURCE: TGType;
function PK_SOURCE(obj: Pointer): PPkSource;
function PK_SOURCE_CLASS(klass: Pointer): PPkSourceClass;
function PK_IS_SOURCE(obj: Pointer): Tgboolean;
function PK_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
function PK_SOURCE_GET_CLASS(obj: Pointer): PPkSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_SOURCE: TGType;
begin
  PK_TYPE_SOURCE := pk_source_get_type;
end;

function PK_SOURCE(obj: Pointer): PPkSource;
begin
  Result := PPkSource(g_type_check_instance_cast(obj, PK_TYPE_SOURCE));
end;

function PK_SOURCE_CLASS(klass: Pointer): PPkSourceClass;
begin
  Result := PPkSourceClass(g_type_check_class_cast(klass, PK_TYPE_SOURCE));
end;

function PK_IS_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_SOURCE);
end;

function PK_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_SOURCE);
end;

function PK_SOURCE_GET_CLASS(obj: Pointer): PPkSourceClass;
begin
  Result := PPkSourceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
