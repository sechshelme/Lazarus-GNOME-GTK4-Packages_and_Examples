unit gmime_filter_windows;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeFilterWindows = record
    parent_object: TGMimeFilter;
    is_windows: Tgboolean;
    claimed_charset: pchar;
  end;
  PGMimeFilterWindows = ^TGMimeFilterWindows;

  TGMimeFilterWindowsClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterWindowsClass = ^TGMimeFilterWindowsClass;

function g_mime_filter_windows_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_windows_new(claimed_charset: pchar): PGMimeFilter; cdecl; external libgmime3;
function g_mime_filter_windows_is_windows_charset(filter: PGMimeFilterWindows): Tgboolean; cdecl; external libgmime3;
function g_mime_filter_windows_real_charset(filter: PGMimeFilterWindows): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:21 ===

function GMIME_TYPE_FILTER_WINDOWS: TGType;
function GMIME_FILTER_WINDOWS(obj: Pointer): PGMimeFilterWindows;
function GMIME_FILTER_WINDOWS_CLASS(klass: Pointer): PGMimeFilterWindowsClass;
function GMIME_IS_FILTER_WINDOWS(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_WINDOWS_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_WINDOWS_GET_CLASS(obj: Pointer): PGMimeFilterWindowsClass;

implementation

function GMIME_TYPE_FILTER_WINDOWS: TGType;
begin
  GMIME_TYPE_FILTER_WINDOWS := g_mime_filter_windows_get_type;
end;

function GMIME_FILTER_WINDOWS(obj: Pointer): PGMimeFilterWindows;
begin
  Result := PGMimeFilterWindows(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_WINDOWS));
end;

function GMIME_FILTER_WINDOWS_CLASS(klass: Pointer): PGMimeFilterWindowsClass;
begin
  Result := PGMimeFilterWindowsClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_WINDOWS));
end;

function GMIME_IS_FILTER_WINDOWS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_WINDOWS);
end;

function GMIME_IS_FILTER_WINDOWS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_WINDOWS);
end;

function GMIME_FILTER_WINDOWS_GET_CLASS(obj: Pointer): PGMimeFilterWindowsClass;
begin
  Result := PGMimeFilterWindowsClass(PGTypeInstance(obj)^.g_class);
end;



end.
