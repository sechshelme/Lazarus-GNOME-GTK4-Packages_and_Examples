unit gmime_filter_strip;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeFilterStrip = record
    parent_object: TGMimeFilter;
    lwsp: pointer;
  end;
  PGMimeFilterStrip = ^TGMimeFilterStrip;

  TGMimeFilterStripClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterStripClass = ^TGMimeFilterStripClass;

function g_mime_filter_strip_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_strip_new: PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:10 ===

function GMIME_TYPE_FILTER_STRIP: TGType;
function GMIME_FILTER_STRIP(obj: Pointer): PGMimeFilterStrip;
function GMIME_FILTER_STRIP_CLASS(klass: Pointer): PGMimeFilterStripClass;
function GMIME_IS_FILTER_STRIP(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_STRIP_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_STRIP_GET_CLASS(obj: Pointer): PGMimeFilterStripClass;

implementation

function GMIME_TYPE_FILTER_STRIP: TGType;
begin
  GMIME_TYPE_FILTER_STRIP := g_mime_filter_strip_get_type;
end;

function GMIME_FILTER_STRIP(obj: Pointer): PGMimeFilterStrip;
begin
  Result := PGMimeFilterStrip(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_STRIP));
end;

function GMIME_FILTER_STRIP_CLASS(klass: Pointer): PGMimeFilterStripClass;
begin
  Result := PGMimeFilterStripClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_STRIP));
end;

function GMIME_IS_FILTER_STRIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_STRIP);
end;

function GMIME_IS_FILTER_STRIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_STRIP);
end;

function GMIME_FILTER_STRIP_GET_CLASS(obj: Pointer): PGMimeFilterStripClass;
begin
  Result := PGMimeFilterStripClass(PGTypeInstance(obj)^.g_class);
end;



end.
