unit ges_source;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESSourcePrivate = type Pointer;

  PGESSource = ^TGESSource;
  TGESSource = record
    parent: TGESTrackElement;
    priv: PGESSourcePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;

  PGESSourceClass = ^TGESSourceClass;
  TGESSourceClass = record
    parent_class: TGESTrackElementClass;
    select_pad: function(source: PGESSource; pad: PGstPad): Tgboolean; cdecl;
    create_source: function(source: PGESSource): PGstElement; cdecl;
    _ges_reserved: array[0..(GES_PADDING - 2) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 28-7-26 13:05:41 ===

function GES_TYPE_SOURCE: TGType;
function GES_SOURCE(obj: Pointer): PGESSource;
function GES_IS_SOURCE(obj: Pointer): Tgboolean;
function GES_SOURCE_CLASS(klass: Pointer): PGESSourceClass;
function GES_IS_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_SOURCE_GET_CLASS(obj: Pointer): PGESSourceClass;
{$ENDIF read_function}

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
