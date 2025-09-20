unit gmime_filter_basic;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter, gmime_encodings;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeFilterBasic = record
    parent_object: TGMimeFilter;
    encoder: TGMimeEncoding;
  end;
  PGMimeFilterBasic = ^TGMimeFilterBasic;

  TGMimeFilterBasicClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterBasicClass = ^TGMimeFilterBasicClass;

function g_mime_filter_basic_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_basic_new(encoding: TGMimeContentEncoding; encode: Tgboolean): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:06 ===

function GMIME_TYPE_FILTER_BASIC: TGType;
function GMIME_FILTER_BASIC(obj: Pointer): PGMimeFilterBasic;
function GMIME_FILTER_BASIC_CLASS(klass: Pointer): PGMimeFilterBasicClass;
function GMIME_IS_FILTER_BASIC(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_BASIC_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_BASIC_GET_CLASS(obj: Pointer): PGMimeFilterBasicClass;

implementation

function GMIME_TYPE_FILTER_BASIC: TGType;
begin
  GMIME_TYPE_FILTER_BASIC := g_mime_filter_basic_get_type;
end;

function GMIME_FILTER_BASIC(obj: Pointer): PGMimeFilterBasic;
begin
  Result := PGMimeFilterBasic(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_BASIC));
end;

function GMIME_FILTER_BASIC_CLASS(klass: Pointer): PGMimeFilterBasicClass;
begin
  Result := PGMimeFilterBasicClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_BASIC));
end;

function GMIME_IS_FILTER_BASIC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_BASIC);
end;

function GMIME_IS_FILTER_BASIC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_BASIC);
end;

function GMIME_FILTER_BASIC_GET_CLASS(obj: Pointer): PGMimeFilterBasicClass;
begin
  Result := PGMimeFilterBasicClass(PGTypeInstance(obj)^.g_class);
end;



end.
