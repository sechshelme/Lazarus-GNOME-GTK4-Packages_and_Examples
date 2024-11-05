/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioVisualizerShader = ^TGstAudioVisualizerShader;
  TGstAudioVisualizerShader = longint;

const
  GST_AUDIO_VISUALIZER_SHADER_NONE = 0;
  GST_AUDIO_VISUALIZER_SHADER_FADE = 1;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_UP = 2;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_DOWN = 3;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_LEFT = 4;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_RIGHT = 5;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_HORIZ_OUT = 6;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_HORIZ_IN = 7;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_VERT_OUT = 8;
  GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_VERT_IN = 9;

type
  TGstAudioVisualizerPrivate = record
  end;
  PGstAudioVisualizerPrivate = ^TGstAudioVisualizerPrivate;

  PGstAudioVisualizer = ^TGstAudioVisualizer;

  TGstAudioVisualizer = record
    parent: TGstElement;
    req_spf: Tguint;
    vinfo: TGstVideoInfo;
    ainfo: TGstAudioInfo;
    priv: PGstAudioVisualizerPrivate;
  end;

  TGstAudioVisualizerShaderFunc = procedure(scope: PGstAudioVisualizer; s: PGstVideoFrame; d: PGstVideoFrame); cdecl;

  PGstAudioVisualizerClass = ^TGstAudioVisualizerClass;

  TGstAudioVisualizerClass = record
    parent_class: TGstElementClass;
    setup: function(scope: PGstAudioVisualizer): Tgboolean; cdecl;
    render: function(scope: PGstAudioVisualizer; audio: PGstBuffer; video: PGstVideoFrame): Tgboolean; cdecl;
    decide_allocation: function(scope: PGstAudioVisualizer; query: PGstQuery): Tgboolean; cdecl;
  end;

function gst_audio_visualizer_get_type: TGType; cdecl; external libgstpbutils;

// === Konventiert am: 27-9-24 15:48:43 ===

function GST_TYPE_AUDIO_VISUALIZER: TGType;
function GST_AUDIO_VISUALIZER(obj: Pointer): PGstAudioVisualizer;
function GST_AUDIO_VISUALIZER_CLASS(klass: Pointer): PGstAudioVisualizerClass;
function GST_IS_SYNAESTHESIA(obj: Pointer): Tgboolean;
function GST_IS_SYNAESTHESIA_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_VISUALIZER_GET_CLASS(obj: Pointer): PGstAudioVisualizerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_VISUALIZER: TGType;
begin
  GST_TYPE_AUDIO_VISUALIZER := gst_audio_visualizer_get_type;
end;

function GST_AUDIO_VISUALIZER(obj: Pointer): PGstAudioVisualizer;
begin
  Result := PGstAudioVisualizer(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_VISUALIZER));
end;

function GST_AUDIO_VISUALIZER_CLASS(klass: Pointer): PGstAudioVisualizerClass;
begin
  Result := PGstAudioVisualizerClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_VISUALIZER));
end;

function GST_IS_SYNAESTHESIA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_VISUALIZER);
end;

function GST_IS_SYNAESTHESIA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_VISUALIZER);
end;

function GST_AUDIO_VISUALIZER_GET_CLASS(obj: Pointer): PGstAudioVisualizerClass;
begin
  Result := PGstAudioVisualizerClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
