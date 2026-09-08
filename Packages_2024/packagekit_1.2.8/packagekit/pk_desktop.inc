{$IFDEF read_interface}



const
  PK_DESKTOP_DEFAULT_APPLICATION_DIR = '/usr/local/share/applications';

type
  PPkDesktopPrivate = type Pointer;

  PPkDesktop = ^TPkDesktop;
  TPkDesktop = record
    parent: TGObject;
    priv: PPkDesktopPrivate;
  end;

  PPkDesktopClass = ^TPkDesktopClass;
  TPkDesktopClass = record
    parent_class: TGObjectClass;
  end;

function pk_desktop_get_type: TGType; cdecl; external libpackagekit;
function pk_desktop_new: PPkDesktop; cdecl; external libpackagekit;
function pk_desktop_open_database(desktop: PPkDesktop; error: PPGError): Tgboolean; cdecl; external libpackagekit;
function pk_desktop_get_files_for_package(desktop: PPkDesktop; package: Pgchar; error: PPGError): PGPtrArray; cdecl; external libpackagekit;
function pk_desktop_get_shown_for_package(desktop: PPkDesktop; package: Pgchar; error: PPGError): PGPtrArray; cdecl; external libpackagekit;
function pk_desktop_get_package_for_file(desktop: PPkDesktop; filename: Pgchar; error: PPGError): Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:03:26 ===

function PK_TYPE_DESKTOP: TGType;
function PK_DESKTOP(obj: Pointer): PPkDesktop;
function PK_DESKTOP_CLASS(klass: Pointer): PPkDesktopClass;
function PK_IS_DESKTOP(obj: Pointer): Tgboolean;
function PK_IS_DESKTOP_CLASS(klass: Pointer): Tgboolean;
function PK_DESKTOP_GET_CLASS(obj: Pointer): PPkDesktopClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_DESKTOP: TGType;
begin
  PK_TYPE_DESKTOP := pk_desktop_get_type;
end;

function PK_DESKTOP(obj: Pointer): PPkDesktop;
begin
  Result := PPkDesktop(g_type_check_instance_cast(obj, PK_TYPE_DESKTOP));
end;

function PK_DESKTOP_CLASS(klass: Pointer): PPkDesktopClass;
begin
  Result := PPkDesktopClass(g_type_check_class_cast(klass, PK_TYPE_DESKTOP));
end;

function PK_IS_DESKTOP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_DESKTOP);
end;

function PK_IS_DESKTOP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_DESKTOP);
end;

function PK_DESKTOP_GET_CLASS(obj: Pointer): PPkDesktopClass;
begin
  Result := PPkDesktopClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
