unit gmime_filter_unix2dos;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeFilterUnix2Dos = record
    parent_object: TGMimeFilter;
    ensure_newline: Tgboolean;
    pc: char;
  end;
  PGMimeFilterUnix2Dos = ^TGMimeFilterUnix2Dos;

  TGMimeFilterUnix2DosClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterUnix2DosClass = ^TGMimeFilterUnix2DosClass;

function g_mime_filter_unix2dos_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_unix2dos_new(ensure_newline: Tgboolean): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:15 ===

function GMIME_TYPE_FILTER_UNIX2DOS: TGType;
function GMIME_FILTER_UNIX2DOS(obj: Pointer): PGMimeFilterUnix2Dos;
function GMIME_FILTER_UNIX2DOS_CLASS(klass: Pointer): PGMimeFilterUnix2DosClass;
function GMIME_IS_FILTER_UNIX2DOS(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_UNIX2DOS_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_UNIX2DOS_GET_CLASS(obj: Pointer): PGMimeFilterUnix2DosClass;

implementation

function GMIME_TYPE_FILTER_UNIX2DOS: TGType;
begin
  GMIME_TYPE_FILTER_UNIX2DOS := g_mime_filter_unix2dos_get_type;
end;

function GMIME_FILTER_UNIX2DOS(obj: Pointer): PGMimeFilterUnix2Dos;
begin
  Result := PGMimeFilterUnix2Dos(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_UNIX2DOS));
end;

function GMIME_FILTER_UNIX2DOS_CLASS(klass: Pointer): PGMimeFilterUnix2DosClass;
begin
  Result := PGMimeFilterUnix2DosClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_UNIX2DOS));
end;

function GMIME_IS_FILTER_UNIX2DOS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_UNIX2DOS);
end;

function GMIME_IS_FILTER_UNIX2DOS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_UNIX2DOS);
end;

function GMIME_FILTER_UNIX2DOS_GET_CLASS(obj: Pointer): PGMimeFilterUnix2DosClass;
begin
  Result := PGMimeFilterUnix2DosClass(PGTypeInstance(obj)^.g_class);
end;



end.
