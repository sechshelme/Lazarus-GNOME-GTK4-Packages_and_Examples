unit gmime_filter_from;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeFilterFromMode = ^TGMimeFilterFromMode;
  TGMimeFilterFromMode = longint;

const
  GMIME_FILTER_FROM_MODE_DEFAULT = 0;
  GMIME_FILTER_FROM_MODE_ESCAPE = 0;
  GMIME_FILTER_FROM_MODE_ARMOR = 1;

type
  TGMimeFilterFrom = record
    parent_object: TGMimeFilter;
    mode: TGMimeFilterFromMode;
    midline: Tgboolean;
  end;
  PGMimeFilterFrom = ^TGMimeFilterFrom;

  TGMimeFilterFromClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterFromClass = ^TGMimeFilterFromClass;

function g_mime_filter_from_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_from_new(mode: TGMimeFilterFromMode): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:41 ===

function GMIME_TYPE_FILTER_FROM: TGType;
function GMIME_FILTER_FROM(obj: Pointer): PGMimeFilterFrom;
function GMIME_FILTER_FROM_CLASS(klass: Pointer): PGMimeFilterFromClass;
function GMIME_IS_FILTER_FROM(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_FROM_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_FROM_GET_CLASS(obj: Pointer): PGMimeFilterFromClass;

implementation

function GMIME_TYPE_FILTER_FROM: TGType;
begin
  GMIME_TYPE_FILTER_FROM := g_mime_filter_from_get_type;
end;

function GMIME_FILTER_FROM(obj: Pointer): PGMimeFilterFrom;
begin
  Result := PGMimeFilterFrom(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_FROM));
end;

function GMIME_FILTER_FROM_CLASS(klass: Pointer): PGMimeFilterFromClass;
begin
  Result := PGMimeFilterFromClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_FROM));
end;

function GMIME_IS_FILTER_FROM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_FROM);
end;

function GMIME_IS_FILTER_FROM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_FROM);
end;

function GMIME_FILTER_FROM_GET_CLASS(obj: Pointer): PGMimeFilterFromClass;
begin
  Result := PGMimeFilterFromClass(PGTypeInstance(obj)^.g_class);
end;



end.
