/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstGLBaseMixerPad = record
    parent: TGstVideoAggregatorPad;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBaseMixerPad = ^TGstGLBaseMixerPad;

  TGstGLBaseMixerPadClass = record
    parent_class: TGstVideoAggregatorPadClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBaseMixerPadClass = ^TGstGLBaseMixerPadClass;

function gst_gl_base_mixer_pad_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLBaseMixerPrivate = record
  end;
  PGstGLBaseMixerPrivate = ^TGstGLBaseMixerPrivate;

  TGstGLBaseMixer = record
    parent: TGstVideoAggregator;
    display: PGstGLDisplay;
    context: PGstGLContext;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
    priv: PGstGLBaseMixerPrivate;
  end;
  PGstGLBaseMixer = ^TGstGLBaseMixer;

  TGstGLBaseMixerClass = record
    parent_class: TGstVideoAggregatorClass;
    supported_gl_api: TGstGLAPI;
    gl_start: function(mix: PGstGLBaseMixer): Tgboolean; cdecl;
    gl_stop: procedure(mix: PGstGLBaseMixer); cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBaseMixerClass = ^TGstGLBaseMixerClass;

function gst_gl_base_mixer_get_type: TGType; cdecl; external libgstgl;
function gst_gl_base_mixer_get_gl_context(mix: PGstGLBaseMixer): PGstGLContext; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 09:15:09 ===

function GST_TYPE_GL_BASE_MIXER_PAD: TGType;
function GST_GL_BASE_MIXER_PAD(obj: Pointer): PGstGLBaseMixerPad;
function GST_GL_BASE_MIXER_PAD_CLASS(klass: Pointer): PGstGLBaseMixerPadClass;
function GST_IS_GL_BASE_MIXER_PAD(obj: Pointer): Tgboolean;
function GST_IS_GL_BASE_MIXER_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_GL_BASE_MIXER_PAD_GET_CLASS(obj: Pointer): PGstGLBaseMixerPadClass;

function GST_TYPE_GL_BASE_MIXER: TGType;
function GST_GL_BASE_MIXER(obj: Pointer): PGstGLBaseMixer;
function GST_GL_BASE_MIXER_CLASS(klass: Pointer): PGstGLBaseMixerClass;
function GST_IS_GL_BASE_MIXER(obj: Pointer): Tgboolean;
function GST_IS_GL_BASE_MIXER_CLASS(klass: Pointer): Tgboolean;
function GST_GL_BASE_MIXER_GET_CLASS(obj: Pointer): PGstGLBaseMixerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_BASE_MIXER_PAD: TGType;
begin
  GST_TYPE_GL_BASE_MIXER_PAD := gst_gl_base_mixer_pad_get_type;
end;

function GST_GL_BASE_MIXER_PAD(obj: Pointer): PGstGLBaseMixerPad;
begin
  Result := PGstGLBaseMixerPad(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_MIXER_PAD));
end;

function GST_GL_BASE_MIXER_PAD_CLASS(klass: Pointer): PGstGLBaseMixerPadClass;
begin
  Result := PGstGLBaseMixerPadClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_MIXER_PAD));
end;

function GST_IS_GL_BASE_MIXER_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_BASE_MIXER_PAD);
end;

function GST_IS_GL_BASE_MIXER_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_BASE_MIXER_PAD);
end;

function GST_GL_BASE_MIXER_PAD_GET_CLASS(obj: Pointer): PGstGLBaseMixerPadClass;
begin
  Result := PGstGLBaseMixerPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_GL_BASE_MIXER: TGType;
begin
  GST_TYPE_GL_BASE_MIXER := gst_gl_base_mixer_get_type;
end;

function GST_GL_BASE_MIXER(obj: Pointer): PGstGLBaseMixer;
begin
  Result := PGstGLBaseMixer(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_MIXER));
end;

function GST_GL_BASE_MIXER_CLASS(klass: Pointer): PGstGLBaseMixerClass;
begin
  Result := PGstGLBaseMixerClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_MIXER));
end;

function GST_IS_GL_BASE_MIXER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_BASE_MIXER);
end;

function GST_IS_GL_BASE_MIXER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_BASE_MIXER);
end;

function GST_GL_BASE_MIXER_GET_CLASS(obj: Pointer): PGstGLBaseMixerClass;
begin
  Result := PGstGLBaseMixerClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
