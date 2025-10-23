
{$IFDEF read_interface}

type
  TGstGLMixerPad = record
    parent: TGstGLBaseMixerPad;
    current_texture: Tguint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMixerPad = ^TGstGLMixerPad;

  TGstGLMixerPadClass = record
    parent_class: TGstGLBaseMixerPadClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMixerPadClass = ^TGstGLMixerPadClass;

type
  TGstGLMixerPrivate = record
  end;
  PGstGLMixerPrivate = ^TGstGLMixerPrivate;

  TGstGLMixer = record
    parent: TGstGLBaseMixer;
    out_caps: PGstCaps;
    priv: PGstGLMixerPrivate;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMixer = ^TGstGLMixer;

  TGstGLMixerClass = record
    parent_class: TGstGLBaseMixerClass;
    process_buffers: function(mix: PGstGLMixer; outbuf: PGstBuffer): Tgboolean; cdecl;
    process_textures: function(mix: PGstGLMixer; out_tex: PGstGLMemory): Tgboolean; cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMixerClass = ^TGstGLMixerClass;

function gst_gl_mixer_pad_get_type: TGType; cdecl; external;
function gst_gl_mixer_get_type: TGType; cdecl; external libgstgl;
procedure gst_gl_mixer_class_add_rgba_pad_templates(klass: PGstGLMixerClass); cdecl; external libgstgl;
function gst_gl_mixer_process_textures(mix: PGstGLMixer; outbuf: PGstBuffer): Tgboolean; cdecl; external libgstgl;
function gst_gl_mixer_get_framebuffer(mix: PGstGLMixer): PGstGLFramebuffer; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 14:57:41 ===

function GST_TYPE_GL_MIXER_PAD: TGType;
function GST_GL_MIXER_PAD(obj: Pointer): PGstGLMixerPad;
function GST_GL_MIXER_PAD_CLASS(klass: Pointer): PGstGLMixerPadClass;
function GST_IS_GL_MIXER_PAD(obj: Pointer): Tgboolean;
function GST_IS_GL_MIXER_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_GL_MIXER_PAD_GET_CLASS(obj: Pointer): PGstGLMixerPadClass;

function GST_TYPE_GL_MIXER: TGType;
function GST_GL_MIXER(obj: Pointer): PGstGLMixer;
function GST_GL_MIXER_CLASS(klass: Pointer): PGstGLMixerClass;
function GST_IS_GL_MIXER(obj: Pointer): Tgboolean;
function GST_IS_GL_MIXER_CLASS(klass: Pointer): Tgboolean;
function GST_GL_MIXER_GET_CLASS(obj: Pointer): PGstGLMixerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_MIXER_PAD: TGType;
begin
  GST_TYPE_GL_MIXER_PAD := gst_gl_mixer_pad_get_type;
end;

function GST_GL_MIXER_PAD(obj: Pointer): PGstGLMixerPad;
begin
  Result := PGstGLMixerPad(g_type_check_instance_cast(obj, GST_TYPE_GL_MIXER_PAD));
end;

function GST_GL_MIXER_PAD_CLASS(klass: Pointer): PGstGLMixerPadClass;
begin
  Result := PGstGLMixerPadClass(g_type_check_class_cast(klass, GST_TYPE_GL_MIXER_PAD));
end;

function GST_IS_GL_MIXER_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_MIXER_PAD);
end;

function GST_IS_GL_MIXER_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_MIXER_PAD);
end;

function GST_GL_MIXER_PAD_GET_CLASS(obj: Pointer): PGstGLMixerPadClass;
begin
  Result := PGstGLMixerPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_GL_MIXER: TGType;
begin
  GST_TYPE_GL_MIXER := gst_gl_mixer_get_type;
end;

function GST_GL_MIXER(obj: Pointer): PGstGLMixer;
begin
  Result := PGstGLMixer(g_type_check_instance_cast(obj, GST_TYPE_GL_MIXER));
end;

function GST_GL_MIXER_CLASS(klass: Pointer): PGstGLMixerClass;
begin
  Result := PGstGLMixerClass(g_type_check_class_cast(klass, GST_TYPE_GL_MIXER));
end;

function GST_IS_GL_MIXER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_MIXER);
end;

function GST_IS_GL_MIXER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_MIXER);
end;

function GST_GL_MIXER_GET_CLASS(obj: Pointer): PGstGLMixerClass;
begin
  Result := PGstGLMixerClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
