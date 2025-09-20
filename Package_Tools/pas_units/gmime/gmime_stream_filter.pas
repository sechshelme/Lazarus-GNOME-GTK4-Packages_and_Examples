unit gmime_stream_filter;

interface

uses
  fp_glib2, fp_gmime3, gmime_stream, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeStreamFilterPrivate = type Pointer;

  TGMimeStreamFilter = record
    parent_object: TGMimeStream;
    priv: PGMimeStreamFilterPrivate;
    source: PGMimeStream;
    owner: Tgboolean;
  end;
  PGMimeStreamFilter = ^TGMimeStreamFilter;

  TGMimeStreamFilterClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamFilterClass = ^TGMimeStreamFilterClass;

function g_mime_stream_filter_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_filter_new(stream: PGMimeStream): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_filter_add(stream: PGMimeStreamFilter; filter: PGMimeFilter): longint; cdecl; external libgmime3;
procedure g_mime_stream_filter_remove(stream: PGMimeStreamFilter; id: longint); cdecl; external libgmime3;
procedure g_mime_stream_filter_set_owner(stream: PGMimeStreamFilter; owner: Tgboolean); cdecl; external libgmime3;
function g_mime_stream_filter_get_owner(stream: PGMimeStreamFilter): Tgboolean; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:56 ===

function GMIME_TYPE_STREAM_FILTER: TGType;
function GMIME_STREAM_FILTER(obj: Pointer): PGMimeStreamFilter;
function GMIME_STREAM_FILTER_CLASS(klass: Pointer): PGMimeStreamFilterClass;
function GMIME_IS_STREAM_FILTER(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_FILTER_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_FILTER_GET_CLASS(obj: Pointer): PGMimeStreamFilterClass;

implementation

function GMIME_TYPE_STREAM_FILTER: TGType;
begin
  GMIME_TYPE_STREAM_FILTER := g_mime_stream_filter_get_type;
end;

function GMIME_STREAM_FILTER(obj: Pointer): PGMimeStreamFilter;
begin
  Result := PGMimeStreamFilter(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_FILTER));
end;

function GMIME_STREAM_FILTER_CLASS(klass: Pointer): PGMimeStreamFilterClass;
begin
  Result := PGMimeStreamFilterClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_FILTER));
end;

function GMIME_IS_STREAM_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_FILTER);
end;

function GMIME_IS_STREAM_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_FILTER);
end;

function GMIME_STREAM_FILTER_GET_CLASS(obj: Pointer): PGMimeStreamFilterClass;
begin
  Result := PGMimeStreamFilterClass(PGTypeInstance(obj)^.g_class);
end;



end.
