unit gmime_filter;

interface

uses
  fp_glib2, fp_gmime3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeFilterPrivate = type Pointer;

  TGMimeFilter = record
    parent_object: TGObject;
    priv: PGMimeFilterPrivate;
    outreal: pchar;
    outbuf: pchar;
    outptr: pchar;
    outsize: Tsize_t;
    outpre: Tsize_t;
    backbuf: pchar;
    backsize: Tsize_t;
    backlen: Tsize_t;
  end;
  PGMimeFilter = ^TGMimeFilter;

  PGMimeFilterClass = ^TGMimeFilterClass;

  TGMimeFilterClass = record
    parent_class: TGObjectClass;
    copy: function(filter: PGMimeFilter): PGMimeFilter; cdecl;
    filter: procedure(filter: PGMimeFilter; inbuf: pchar; inlen: Tsize_t; prespace: Tsize_t; outbuf: PPchar;
      outlen: Psize_t; outprespace: Psize_t); cdecl;
    complete: procedure(filter: PGMimeFilter; inbuf: pchar; inlen: Tsize_t; prespace: Tsize_t; outbuf: PPchar;
      outlen: Psize_t; outprespace: Psize_t); cdecl;
    reset: procedure(filter: PGMimeFilter); cdecl;
  end;

function g_mime_filter_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_copy(filter: PGMimeFilter): PGMimeFilter; cdecl; external libgmime3;
procedure g_mime_filter_filter(filter: PGMimeFilter; inbuf: pchar; inlen: Tsize_t; prespace: Tsize_t; outbuf: PPchar;
  outlen: Psize_t; outprespace: Psize_t); cdecl; external libgmime3;
procedure g_mime_filter_complete(filter: PGMimeFilter; inbuf: pchar; inlen: Tsize_t; prespace: Tsize_t; outbuf: PPchar;
  outlen: Psize_t; outprespace: Psize_t); cdecl; external libgmime3;
procedure g_mime_filter_reset(filter: PGMimeFilter); cdecl; external libgmime3;
procedure g_mime_filter_backup(filter: PGMimeFilter; data: pchar; length: Tsize_t); cdecl; external libgmime3;
procedure g_mime_filter_set_size(filter: PGMimeFilter; size: Tsize_t; keep: Tgboolean); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:00 ===

function GMIME_TYPE_FILTER: TGType;
function GMIME_FILTER(obj: Pointer): PGMimeFilter;
function GMIME_FILTER_CLASS(klass: Pointer): PGMimeFilterClass;
function GMIME_IS_FILTER(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_GET_CLASS(obj: Pointer): PGMimeFilterClass;

implementation

function GMIME_TYPE_FILTER: TGType;
begin
  GMIME_TYPE_FILTER := g_mime_filter_get_type;
end;

function GMIME_FILTER(obj: Pointer): PGMimeFilter;
begin
  Result := PGMimeFilter(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER));
end;

function GMIME_FILTER_CLASS(klass: Pointer): PGMimeFilterClass;
begin
  Result := PGMimeFilterClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER));
end;

function GMIME_IS_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER);
end;

function GMIME_IS_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER);
end;

function GMIME_FILTER_GET_CLASS(obj: Pointer): PGMimeFilterClass;
begin
  Result := PGMimeFilterClass(PGTypeInstance(obj)^.g_class);
end;



end.
