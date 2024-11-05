/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstAudioAggregatorPadPrivate = record
  end;
  PGstAudioAggregatorPadPrivate = ^TGstAudioAggregatorPadPrivate;

  TGstAudioAggregatorPad = record
    parent: TGstAggregatorPad;
    info: TGstAudioInfo;
    priv: PGstAudioAggregatorPadPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioAggregatorPad = ^TGstAudioAggregatorPad;

  TGstAudioAggregatorPadClass = record
    parent_class: TGstAggregatorPadClass;
    convert_buffer: function(pad: PGstAudioAggregatorPad; in_info: PGstAudioInfo; out_info: PGstAudioInfo; buffer: PGstBuffer): PGstBuffer; cdecl;
    update_conversion_info: procedure(pad: PGstAudioAggregatorPad); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstAudioAggregatorPadClass = ^TGstAudioAggregatorPadClass;


function gst_audio_aggregator_pad_get_type: TGType; cdecl; external libgstaudio;

type
  TGstAudioAggregatorConvertPadPrivate = record
  end;
  PGstAudioAggregatorConvertPadPrivate = ^TGstAudioAggregatorConvertPadPrivate;

  TGstAudioAggregatorConvertPad = record
    parent: TGstAudioAggregatorPad;
    priv: PGstAudioAggregatorConvertPadPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioAggregatorConvertPad = ^TGstAudioAggregatorConvertPad;

  TGstAudioAggregatorConvertPadClass = record
    parent_class: TGstAudioAggregatorPadClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioAggregatorConvertPadClass = ^TGstAudioAggregatorConvertPadClass;


function gst_audio_aggregator_convert_pad_get_type: TGType; cdecl; external libgstaudio;

type
  TGstAudioAggregatorPrivate = record
  end;
  PGstAudioAggregatorPrivate = ^TGstAudioAggregatorPrivate;

  TGstAudioAggregator = record
    parent: TGstAggregator;
    current_caps: PGstCaps;
    priv: PGstAudioAggregatorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioAggregator = ^TGstAudioAggregator;

  TGstAudioAggregatorClass = record
    parent_class: TGstAggregatorClass;
    create_output_buffer: function(aagg: PGstAudioAggregator; num_frames: Tguint): PGstBuffer; cdecl;
    aggregate_one_buffer: function(aagg: PGstAudioAggregator; pad: PGstAudioAggregatorPad; inbuf: PGstBuffer; in_offset: Tguint; outbuf: PGstBuffer;
      out_offset: Tguint; num_frames: Tguint): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstAudioAggregatorClass = ^TGstAudioAggregatorClass;

function gst_audio_aggregator_get_type: TGType; cdecl; external libgstaudio;
procedure gst_audio_aggregator_set_sink_caps(aagg: PGstAudioAggregator; pad: PGstAudioAggregatorPad; caps: PGstCaps); cdecl; external libgstaudio;


// === Konventiert am: 28-9-24 18:08:26 ===

function GST_TYPE_AUDIO_AGGREGATOR_PAD: TGType;
function GST_AUDIO_AGGREGATOR_PAD(obj: Pointer): PGstAudioAggregatorPad;
function GST_AUDIO_AGGREGATOR_PAD_CLASS(klass: Pointer): PGstAudioAggregatorPadClass;
function GST_IS_AUDIO_AGGREGATOR_PAD(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_AGGREGATOR_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_AGGREGATOR_PAD_GET_CLASS(obj: Pointer): PGstAudioAggregatorPadClass;

function GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD: TGType;
function GST_AUDIO_AGGREGATOR_CONVERT_PAD(obj: Pointer): PGstAudioAggregatorConvertPad;
function GST_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): PGstAudioAggregatorConvertPadClass;
function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstAudioAggregatorConvertPadClass;

function GST_TYPE_AUDIO_AGGREGATOR: TGType;
function GST_AUDIO_AGGREGATOR(obj: Pointer): PGstAudioAggregator;
function GST_AUDIO_AGGREGATOR_CLASS(klass: Pointer): PGstAudioAggregatorClass;
function GST_IS_AUDIO_AGGREGATOR(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_AGGREGATOR_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_AGGREGATOR_GET_CLASS(obj: Pointer): PGstAudioAggregatorClass;



{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_AGGREGATOR_PAD: TGType;
begin
  GST_TYPE_AUDIO_AGGREGATOR_PAD := gst_audio_aggregator_pad_get_type;
end;

function GST_AUDIO_AGGREGATOR_PAD(obj: Pointer): PGstAudioAggregatorPad;
begin
  Result := PGstAudioAggregatorPad(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_AGGREGATOR_PAD));
end;

function GST_AUDIO_AGGREGATOR_PAD_CLASS(klass: Pointer): PGstAudioAggregatorPadClass;
begin
  Result := PGstAudioAggregatorPadClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_AGGREGATOR_PAD));
end;

function GST_IS_AUDIO_AGGREGATOR_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_AGGREGATOR_PAD);
end;

function GST_IS_AUDIO_AGGREGATOR_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_AGGREGATOR_PAD);
end;

function GST_AUDIO_AGGREGATOR_PAD_GET_CLASS(obj: Pointer): PGstAudioAggregatorPadClass;
begin
  Result := PGstAudioAggregatorPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD: TGType;
begin
  GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD := gst_audio_aggregator_convert_pad_get_type;
end;

function GST_AUDIO_AGGREGATOR_CONVERT_PAD(obj: Pointer): PGstAudioAggregatorConvertPad;
begin
  Result := PGstAudioAggregatorConvertPad(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD));
end;

function GST_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): PGstAudioAggregatorConvertPadClass;
begin
  Result := PGstAudioAggregatorConvertPadClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD));
end;

function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD);
end;

function GST_IS_AUDIO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_AGGREGATOR_CONVERT_PAD);
end;

function GST_AUDIO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstAudioAggregatorConvertPadClass;
begin
  Result := PGstAudioAggregatorConvertPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_AUDIO_AGGREGATOR: TGType;
begin
  GST_TYPE_AUDIO_AGGREGATOR := gst_audio_aggregator_get_type;
end;

function GST_AUDIO_AGGREGATOR(obj: Pointer): PGstAudioAggregator;
begin
  Result := PGstAudioAggregator(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_AGGREGATOR));
end;

function GST_AUDIO_AGGREGATOR_CLASS(klass: Pointer): PGstAudioAggregatorClass;
begin
  Result := PGstAudioAggregatorClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_AGGREGATOR));
end;

function GST_IS_AUDIO_AGGREGATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_AGGREGATOR);
end;

function GST_IS_AUDIO_AGGREGATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_AGGREGATOR);
end;

function GST_AUDIO_AGGREGATOR_GET_CLASS(obj: Pointer): PGstAudioAggregatorClass;
begin
  Result := PGstAudioAggregatorClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
