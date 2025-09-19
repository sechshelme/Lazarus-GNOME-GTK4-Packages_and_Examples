unit gmime_filter_enriched;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GMIME_FILTER_ENRICHED_IS_RICHTEXT = 1 shl 0;

type
  TGMimeFilterEnriched = record
    parent_object: TGMimeFilter;
    flags: Tguint32;
    nofill: longint;
  end;
  PGMimeFilterEnriched = ^TGMimeFilterEnriched;

  TGMimeFilterEnrichedClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterEnrichedClass = ^TGMimeFilterEnrichedClass;

function g_mime_filter_enriched_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_enriched_new(flags: Tguint32): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:34 ===

function GMIME_TYPE_FILTER_ENRICHED: TGType;
function GMIME_FILTER_ENRICHED(obj: Pointer): PGMimeFilterEnriched;
function GMIME_FILTER_ENRICHED_CLASS(klass: Pointer): PGMimeFilterEnrichedClass;
function GMIME_IS_FILTER_ENRICHED(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_ENRICHED_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_ENRICHED_GET_CLASS(obj: Pointer): PGMimeFilterEnrichedClass;

implementation

function GMIME_TYPE_FILTER_ENRICHED: TGType;
begin
  GMIME_TYPE_FILTER_ENRICHED := g_mime_filter_enriched_get_type;
end;

function GMIME_FILTER_ENRICHED(obj: Pointer): PGMimeFilterEnriched;
begin
  Result := PGMimeFilterEnriched(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_ENRICHED));
end;

function GMIME_FILTER_ENRICHED_CLASS(klass: Pointer): PGMimeFilterEnrichedClass;
begin
  Result := PGMimeFilterEnrichedClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_ENRICHED));
end;

function GMIME_IS_FILTER_ENRICHED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_ENRICHED);
end;

function GMIME_IS_FILTER_ENRICHED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_ENRICHED);
end;

function GMIME_FILTER_ENRICHED_GET_CLASS(obj: Pointer): PGMimeFilterEnrichedClass;
begin
  Result := PGMimeFilterEnrichedClass(PGTypeInstance(obj)^.g_class);
end;



end.
