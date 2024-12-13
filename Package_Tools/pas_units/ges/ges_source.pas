unit ges_source;

interface

uses
  fp_glib2, fp_gst, ges_types, ges_track_element;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (Source, source, SOURCE); }
type
  TGESSourcePrivate = record
  end;
  PGESSourcePrivate = ^TGESSourcePrivate;

  TGESSource = record
    parent: TGESTrackElement;
    priv: PGESSourcePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESSource = ^TGESSource;

  TGESSourceClass = record
    parent_class: TGESTrackElementClass;
    select_pad: function(Source: PGESSource; pad: PGstPad): Tgboolean; cdecl;
    create_source: function(Source: PGESSource): PGstElement; cdecl;
    _ges_reserved: array[0..(GES_PADDING - 2) - 1] of Tgpointer;
  end;
  PGESSourceClass = ^TGESSourceClass;

function ges_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 15:25:23 ===

function GES_TYPE_SOURCE: TGType;
function GES_SOURCE(obj: Pointer): PGESSource;
function GES_IS_SOURCE(obj: Pointer): Tgboolean;
function GES_SOURCE_CLASS(klass: Pointer): PGESSourceClass;
function GES_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_GET_CLASS(obj: Pointer): PGESSourceClass;

implementation

function GES_TYPE_SOURCE: TGType;
begin
  Result := ges_source_get_type;
end;

function GES_SOURCE(obj: Pointer): PGESSource;
begin
  Result := PGESSource(g_type_check_instance_cast(obj, GES_TYPE_SOURCE));
end;

function GES_IS_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_SOURCE);
end;

function GES_SOURCE_CLASS(klass: Pointer): PGESSourceClass;
begin
  Result := PGESSourceClass(g_type_check_class_cast(klass, GES_TYPE_SOURCE));
end;

function GES_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_SOURCE);
end;

function GES_SOURCE_GET_CLASS(obj: Pointer): PGESSourceClass;
begin
  Result := PGESSourceClass(PGTypeInstance(obj)^.g_class);
end;




end.
