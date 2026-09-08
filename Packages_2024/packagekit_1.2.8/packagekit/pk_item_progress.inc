{$IFDEF read_interface}


type
  PPkItemProgressPrivate = type Pointer;

  PPkItemProgress = ^TPkItemProgress;
  TPkItemProgress = record
    parent: TPkSource;
    priv: PPkItemProgressPrivate;
  end;

  PPkItemProgressClass = ^TPkItemProgressClass;
  TPkItemProgressClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_item_progress_get_type: TGType; cdecl; external libpackagekit;
function pk_item_progress_new: PPkItemProgress; cdecl; external libpackagekit;
function pk_item_progress_get_status(item_progress: PPkItemProgress): TPkStatusEnum; cdecl; external libpackagekit;
function pk_item_progress_get_percentage(item_progress: PPkItemProgress): Tguint; cdecl; external libpackagekit;
function pk_item_progress_get_package_id(item_progress: PPkItemProgress): Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:08:28 ===

function PK_TYPE_ITEM_PROGRESS: TGType;
function PK_ITEM_PROGRESS(obj: Pointer): PPkItemProgress;
function PK_ITEM_PROGRESS_CLASS(klass: Pointer): PPkItemProgressClass;
function PK_IS_ITEM_PROGRESS(obj: Pointer): Tgboolean;
function PK_IS_ITEM_PROGRESS_CLASS(klass: Pointer): Tgboolean;
function PK_ITEM_PROGRESS_GET_CLASS(obj: Pointer): PPkItemProgressClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_ITEM_PROGRESS: TGType;
begin
  PK_TYPE_ITEM_PROGRESS := pk_item_progress_get_type;
end;

function PK_ITEM_PROGRESS(obj: Pointer): PPkItemProgress;
begin
  Result := PPkItemProgress(g_type_check_instance_cast(obj, PK_TYPE_ITEM_PROGRESS));
end;

function PK_ITEM_PROGRESS_CLASS(klass: Pointer): PPkItemProgressClass;
begin
  Result := PPkItemProgressClass(g_type_check_class_cast(klass, PK_TYPE_ITEM_PROGRESS));
end;

function PK_IS_ITEM_PROGRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_ITEM_PROGRESS);
end;

function PK_IS_ITEM_PROGRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_ITEM_PROGRESS);
end;

function PK_ITEM_PROGRESS_GET_CLASS(obj: Pointer): PPkItemProgressClass;
begin
  Result := PPkItemProgressClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
