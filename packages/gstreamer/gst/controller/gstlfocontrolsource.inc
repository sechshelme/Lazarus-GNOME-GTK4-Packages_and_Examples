/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   15:16                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstLFOWaveform = ^TGstLFOWaveform;
  TGstLFOWaveform = longint;

const
  GST_LFO_WAVEFORM_SINE = 0;
  GST_LFO_WAVEFORM_SQUARE = 1;
  GST_LFO_WAVEFORM_SAW = 2;
  GST_LFO_WAVEFORM_REVERSE_SAW = 3;
  GST_LFO_WAVEFORM_TRIANGLE = 4;

type
  TGstLFOControlSourcePrivate = record
  end;
  PGstLFOControlSourcePrivate = ^TGstLFOControlSourcePrivate;

  TGstLFOControlSource = record
    parent: TGstControlSource;
    priv: PGstLFOControlSourcePrivate;
    lock: TGMutex;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstLFOControlSource = ^TGstLFOControlSource;

  TGstLFOControlSourceClass = record
    parent_class: TGstControlSourceClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstLFOControlSourceClass = ^TGstLFOControlSourceClass;


function gst_lfo_control_source_get_type: TGType; cdecl; external libgstcontroller;
function gst_lfo_control_source_new: PGstControlSource; cdecl; external libgstcontroller;

// === Konventiert am: 7-10-24 14:52:16 ===

function GST_TYPE_LFO_CONTROL_SOURCE: TGType;
function GST_LFO_CONTROL_SOURCE(obj: Pointer): PGstLFOControlSource;
function GST_LFO_CONTROL_SOURCE_CLASS(klass: Pointer): PGstLFOControlSourceClass;
function GST_IS_LFO_CONTROL_SOURCE(obj: Pointer): Tgboolean;
function GST_IS_LFO_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GST_LFO_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstLFOControlSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_LFO_CONTROL_SOURCE: TGType;
begin
  GST_TYPE_LFO_CONTROL_SOURCE := gst_lfo_control_source_get_type;
end;

function GST_LFO_CONTROL_SOURCE(obj: Pointer): PGstLFOControlSource;
begin
  Result := PGstLFOControlSource(g_type_check_instance_cast(obj, GST_TYPE_LFO_CONTROL_SOURCE));
end;

function GST_LFO_CONTROL_SOURCE_CLASS(klass: Pointer): PGstLFOControlSourceClass;
begin
  Result := PGstLFOControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_LFO_CONTROL_SOURCE));
end;

function GST_IS_LFO_CONTROL_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_LFO_CONTROL_SOURCE);
end;

function GST_IS_LFO_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_LFO_CONTROL_SOURCE);
end;

function GST_LFO_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstLFOControlSourceClass;
begin
  Result := PGstLFOControlSourceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
