/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGstAudioFilter = record
    basetransform: TGstBaseTransform;
    info: TGstAudioInfo;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioFilter = ^TGstAudioFilter;

type
  TGstAudioFilterClass = record
    basetransformclass: TGstBaseTransformClass;
    setup: function(filter: PGstAudioFilter; info: PGstAudioInfo): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioFilterClass = ^TGstAudioFilterClass;

function gst_audio_filter_get_type: TGType; cdecl; external libgstaudio;
procedure gst_audio_filter_class_add_pad_templates(klass: PGstAudioFilterClass; allowed_caps: PGstCaps); cdecl; external libgstaudio;

function GST_AUDIO_FILTER_CAST(obj: Pointer): PGstAudioFilter;
function GST_AUDIO_FILTER_CLASS_CAST(klass: Pointer): PGstAudioFilterClass;

function GST_AUDIO_FILTER_INFO(filter: Pointer): PGstAudioInfo;
function GST_AUDIO_FILTER_FORMAT(filter: Pointer): TGstAudioFormat;
function GST_AUDIO_FILTER_RATE(filter: Pointer): Tgint;
function GST_AUDIO_FILTER_CHANNELS(filter: Pointer): Tgint;
function GST_AUDIO_FILTER_BPF(filter: Pointer): Tgint;
function GST_AUDIO_FILTER_BPS(filter: Pointer): Tgint;

// === Konventiert am: 28-9-24 19:33:26 ===

function GST_TYPE_AUDIO_FILTER: TGType;
function GST_AUDIO_FILTER(obj: Pointer): PGstAudioFilter;
function GST_AUDIO_FILTER_CLASS(klass: Pointer): PGstAudioFilterClass;
function GST_IS_AUDIO_FILTER(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_FILTER_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_FILTER_GET_CLASS(obj: Pointer): PGstAudioFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_FILTER: TGType;
begin
  GST_TYPE_AUDIO_FILTER := gst_audio_filter_get_type;
end;

function GST_AUDIO_FILTER(obj: Pointer): PGstAudioFilter;
begin
  Result := PGstAudioFilter(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_FILTER));
end;

function GST_AUDIO_FILTER_CLASS(klass: Pointer): PGstAudioFilterClass;
begin
  Result := PGstAudioFilterClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_FILTER));
end;

function GST_IS_AUDIO_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_FILTER);
end;

function GST_IS_AUDIO_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_FILTER);
end;

function GST_AUDIO_FILTER_GET_CLASS(obj: Pointer): PGstAudioFilterClass;
begin
  Result := PGstAudioFilterClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_AUDIO_FILTER_CAST(obj: Pointer): PGstAudioFilter;
begin
  GST_AUDIO_FILTER_CAST := PGstAudioFilter(obj);
end;

function GST_AUDIO_FILTER_CLASS_CAST(klass: Pointer): PGstAudioFilterClass;
begin
  GST_AUDIO_FILTER_CLASS_CAST := PGstAudioFilterClass(klass);
end;

function GST_AUDIO_FILTER_INFO(filter: Pointer): PGstAudioInfo;
begin
  GST_AUDIO_FILTER_INFO := @((GST_AUDIO_FILTER_CAST(filter))^.info);
end;

function GST_AUDIO_FILTER_FORMAT(filter: Pointer): TGstAudioFormat;
begin
  GST_AUDIO_FILTER_FORMAT := GST_AUDIO_INFO_FORMAT(GST_AUDIO_FILTER_INFO(filter));
end;

function GST_AUDIO_FILTER_RATE(filter: Pointer): Tgint;
begin
  GST_AUDIO_FILTER_RATE := GST_AUDIO_INFO_RATE(GST_AUDIO_FILTER_INFO(filter));
end;

function GST_AUDIO_FILTER_CHANNELS(filter: Pointer): Tgint;
begin
  GST_AUDIO_FILTER_CHANNELS := GST_AUDIO_INFO_CHANNELS(GST_AUDIO_FILTER_INFO(filter));
end;

function GST_AUDIO_FILTER_BPF(filter: Pointer): Tgint;
begin
  GST_AUDIO_FILTER_BPF := GST_AUDIO_INFO_BPF(GST_AUDIO_FILTER_INFO(filter));
end;

function GST_AUDIO_FILTER_BPS(filter: Pointer): Tgint;
begin
  GST_AUDIO_FILTER_BPS := GST_AUDIO_INFO_BPS(GST_AUDIO_FILTER_INFO(filter));
end;


{$ENDIF read_implementation}
