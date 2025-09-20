unit gmime_stream_cat;

interface

uses
  fp_glib2, fp_gmime3, gmime_stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeStreamCat = record
    parent_object: TGMimeStream;
    sources: Pcat_node;
    current: Pcat_node;
  end;
  PGMimeStreamCat = ^TGMimeStreamCat;

  TGMimeStreamCatClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamCatClass = ^TGMimeStreamCatClass;

function g_mime_stream_cat_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_cat_new: PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_cat_add_source(cat: PGMimeStreamCat; source: PGMimeStream): longint; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:48 ===

function GMIME_TYPE_STREAM_CAT: TGType;
function GMIME_STREAM_CAT(obj: Pointer): PGMimeStreamCat;
function GMIME_STREAM_CAT_CLASS(klass: Pointer): PGMimeStreamCatClass;
function GMIME_IS_STREAM_CAT(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_CAT_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_CAT_GET_CLASS(obj: Pointer): PGMimeStreamCatClass;

implementation

function GMIME_TYPE_STREAM_CAT: TGType;
begin
  GMIME_TYPE_STREAM_CAT := g_mime_stream_cat_get_type;
end;

function GMIME_STREAM_CAT(obj: Pointer): PGMimeStreamCat;
begin
  Result := PGMimeStreamCat(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_CAT));
end;

function GMIME_STREAM_CAT_CLASS(klass: Pointer): PGMimeStreamCatClass;
begin
  Result := PGMimeStreamCatClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_CAT));
end;

function GMIME_IS_STREAM_CAT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_CAT);
end;

function GMIME_IS_STREAM_CAT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_CAT);
end;

function GMIME_STREAM_CAT_GET_CLASS(obj: Pointer): PGMimeStreamCatClass;
begin
  Result := PGMimeStreamCatClass(PGTypeInstance(obj)^.g_class);
end;



end.
