unit gmime_filter_dos2unix;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeFilterDos2Unix = record
    parent_object: TGMimeFilter;
    ensure_newline: Tgboolean;
    pc: char;
  end;
  PGMimeFilterDos2Unix = ^TGMimeFilterDos2Unix;

  TGMimeFilterDos2UnixClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterDos2UnixClass = ^TGMimeFilterDos2UnixClass;

function g_mime_filter_dos2unix_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_dos2unix_new(ensure_newline: Tgboolean): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:29 ===

function GMIME_TYPE_FILTER_DOS2UNIX: TGType;
function GMIME_FILTER_DOS2UNIX(obj: Pointer): PGMimeFilterDos2Unix;
function GMIME_FILTER_DOS2UNIX_CLASS(klass: Pointer): PGMimeFilterDos2UnixClass;
function GMIME_IS_FILTER_DOS2UNIX(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_DOS2UNIX_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_DOS2UNIX_GET_CLASS(obj: Pointer): PGMimeFilterDos2UnixClass;

implementation

function GMIME_TYPE_FILTER_DOS2UNIX: TGType;
begin
  GMIME_TYPE_FILTER_DOS2UNIX := g_mime_filter_dos2unix_get_type;
end;

function GMIME_FILTER_DOS2UNIX(obj: Pointer): PGMimeFilterDos2Unix;
begin
  Result := PGMimeFilterDos2Unix(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_DOS2UNIX));
end;

function GMIME_FILTER_DOS2UNIX_CLASS(klass: Pointer): PGMimeFilterDos2UnixClass;
begin
  Result := PGMimeFilterDos2UnixClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_DOS2UNIX));
end;

function GMIME_IS_FILTER_DOS2UNIX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_DOS2UNIX);
end;

function GMIME_IS_FILTER_DOS2UNIX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_DOS2UNIX);
end;

function GMIME_FILTER_DOS2UNIX_GET_CLASS(obj: Pointer): PGMimeFilterDos2UnixClass;
begin
  Result := PGMimeFilterDos2UnixClass(PGTypeInstance(obj)^.g_class);
end;



end.
