unit ges_audio_source;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESAudioSourceClass = ^TGESAudioSourceClass;
  TGESAudioSourceClass = record
    parent_class: TGESSourceClass;
    create_source: function(obj: PGESTrackElement): PGstElement; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_audio_source_get_type: TGType; cdecl; external libges;

// === Konventiert am: 27-7-26 19:48:59 ===

function GES_TYPE_AUDIO_SOURCE: TGType;
function GES_AUDIO_SOURCE(obj: Pointer): PGESAudioSource;
function GES_IS_AUDIO_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_SOURCE_CLASS(klass: Pointer): PGESAudioSourceClass;
function GES_IS_AUDIO_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_SOURCE_GET_CLASS(obj: Pointer): PGESAudioSourceClass;
{$ENDIF read_function}

implementation

function GES_TYPE_AUDIO_SOURCE: TGType;
begin
  Result := ges_audio_source_get_type;
end;

function GES_AUDIO_SOURCE(obj: Pointer): PGESAudioSource;
begin
  Result := PGESAudioSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_SOURCE));
end;

function GES_IS_AUDIO_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_SOURCE);
end;

function GES_AUDIO_SOURCE_CLASS(klass: Pointer): PGESAudioSourceClass;
begin
  Result := PGESAudioSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_SOURCE));
end;

function GES_IS_AUDIO_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_SOURCE);
end;

function GES_AUDIO_SOURCE_GET_CLASS(obj: Pointer): PGESAudioSourceClass;
begin
  Result := PGESAudioSourceClass(PGTypeInstance(obj)^.g_class);
end;

end.
