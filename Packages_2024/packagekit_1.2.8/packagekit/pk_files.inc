{$IFDEF read_interface}


type
  PPkFilesPrivate = type Pointer;

  PPkFiles = ^TPkFiles;
  TPkFiles = record
    parent: TPkSource;
    priv: PPkFilesPrivate;
  end;

  PPkFilesClass = ^TPkFilesClass;
  TPkFilesClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_files_get_type: TGType; cdecl; external libpackagekit;
function pk_files_new: PPkFiles; cdecl; external libpackagekit;
function pk_files_get_package_id(files: PPkFiles): Pgchar; cdecl; external libpackagekit;
function pk_files_get_files(files: PPkFiles): PPgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:08:32 ===

function PK_TYPE_FILES: TGType;
function PK_FILES(obj: Pointer): PPkFiles;
function PK_FILES_CLASS(klass: Pointer): PPkFilesClass;
function PK_IS_FILES(obj: Pointer): Tgboolean;
function PK_IS_FILES_CLASS(klass: Pointer): Tgboolean;
function PK_FILES_GET_CLASS(obj: Pointer): PPkFilesClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_FILES: TGType;
begin
  PK_TYPE_FILES := pk_files_get_type;
end;

function PK_FILES(obj: Pointer): PPkFiles;
begin
  Result := PPkFiles(g_type_check_instance_cast(obj, PK_TYPE_FILES));
end;

function PK_FILES_CLASS(klass: Pointer): PPkFilesClass;
begin
  Result := PPkFilesClass(g_type_check_class_cast(klass, PK_TYPE_FILES));
end;

function PK_IS_FILES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_FILES);
end;

function PK_IS_FILES_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_FILES);
end;

function PK_FILES_GET_CLASS(obj: Pointer): PPkFilesClass;
begin
  Result := PPkFilesClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
