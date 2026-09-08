{$IFDEF read_interface}


type
  PPkMediaChangeRequiredPrivate = type Pointer;

  PPkMediaChangeRequired = ^TPkMediaChangeRequired;
  TPkMediaChangeRequired = record
    parent: TPkSource;
    priv: PPkMediaChangeRequiredPrivate;
  end;

  PPkMediaChangeRequiredClass = ^TPkMediaChangeRequiredClass;
  TPkMediaChangeRequiredClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_media_change_required_get_type: TGType; cdecl; external libpackagekit;
function pk_media_change_required_new: PPkMediaChangeRequired; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:08:22 ===

function PK_TYPE_MEDIA_CHANGE_REQUIRED: TGType;
function PK_MEDIA_CHANGE_REQUIRED(obj: Pointer): PPkMediaChangeRequired;
function PK_MEDIA_CHANGE_REQUIRED_CLASS(klass: Pointer): PPkMediaChangeRequiredClass;
function PK_IS_MEDIA_CHANGE_REQUIRED(obj: Pointer): Tgboolean;
function PK_IS_MEDIA_CHANGE_REQUIRED_CLASS(klass: Pointer): Tgboolean;
function PK_MEDIA_CHANGE_REQUIRED_GET_CLASS(obj: Pointer): PPkMediaChangeRequiredClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_MEDIA_CHANGE_REQUIRED: TGType;
begin
  PK_TYPE_MEDIA_CHANGE_REQUIRED := pk_media_change_required_get_type;
end;

function PK_MEDIA_CHANGE_REQUIRED(obj: Pointer): PPkMediaChangeRequired;
begin
  Result := PPkMediaChangeRequired(g_type_check_instance_cast(obj, PK_TYPE_MEDIA_CHANGE_REQUIRED));
end;

function PK_MEDIA_CHANGE_REQUIRED_CLASS(klass: Pointer): PPkMediaChangeRequiredClass;
begin
  Result := PPkMediaChangeRequiredClass(g_type_check_class_cast(klass, PK_TYPE_MEDIA_CHANGE_REQUIRED));
end;

function PK_IS_MEDIA_CHANGE_REQUIRED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_MEDIA_CHANGE_REQUIRED);
end;

function PK_IS_MEDIA_CHANGE_REQUIRED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_MEDIA_CHANGE_REQUIRED);
end;

function PK_MEDIA_CHANGE_REQUIRED_GET_CLASS(obj: Pointer): PPkMediaChangeRequiredClass;
begin
  Result := PPkMediaChangeRequiredClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
