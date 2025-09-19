unit gmime_filter_best;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter, gmime_charset, gmime_encodings;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeFilterBestFlags = ^TGMimeFilterBestFlags;
  TGMimeFilterBestFlags = longint;

const
  GMIME_FILTER_BEST_CHARSET = 1 shl 0;
  GMIME_FILTER_BEST_ENCODING = 1 shl 1;

type
  TGMimeFilterBest = bitpacked record
    parent_object: TGMimeFilter;
    flags: TGMimeFilterBestFlags;
    charset: TGMimeCharset;
    count0: dword;
    count8: dword;
    total: dword;
    maxline: dword;
    linelen: dword;
    frombuf: array[0..5] of byte;
    fromlen: 0..15;
    hadfrom: 0..1;
    startline: 0..1;
    midline: 0..1;
  end;
  PGMimeFilterBest = ^TGMimeFilterBest;

type
  TGMimeFilterBestClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterBestClass = ^TGMimeFilterBestClass;

function g_mime_filter_best_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_best_new(flags: TGMimeFilterBestFlags): PGMimeFilter; cdecl; external libgmime3;
function g_mime_filter_best_charset(best: PGMimeFilterBest): pchar; cdecl; external libgmime3;
function g_mime_filter_best_encoding(best: PGMimeFilterBest; constraint: TGMimeEncodingConstraint): TGMimeContentEncoding; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:13 ===

function GMIME_TYPE_FILTER_BEST: TGType;
function GMIME_FILTER_BEST(obj: Pointer): PGMimeFilterBest;
function GMIME_FILTER_BEST_CLASS(klass: Pointer): PGMimeFilterBestClass;
function GMIME_IS_FILTER_BEST(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_BEST_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_BEST_GET_CLASS(obj: Pointer): PGMimeFilterBestClass;

implementation

function GMIME_TYPE_FILTER_BEST: TGType;
begin
  GMIME_TYPE_FILTER_BEST := g_mime_filter_best_get_type;
end;

function GMIME_FILTER_BEST(obj: Pointer): PGMimeFilterBest;
begin
  Result := PGMimeFilterBest(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_BEST));
end;

function GMIME_FILTER_BEST_CLASS(klass: Pointer): PGMimeFilterBestClass;
begin
  Result := PGMimeFilterBestClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_BEST));
end;

function GMIME_IS_FILTER_BEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_BEST);
end;

function GMIME_IS_FILTER_BEST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_BEST);
end;

function GMIME_FILTER_BEST_GET_CLASS(obj: Pointer): PGMimeFilterBestClass;
begin
  Result := PGMimeFilterBestClass(PGTypeInstance(obj)^.g_class);
end;


end.
