unit gstappsrc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function GST_APP_SRC_CAST(obj : longint) : PGstAppSrc;

type
  PGstAppSrcCallbacks = ^TGstAppSrcCallbacks;
  TGstAppSrcCallbacks = record
      need_data : procedure (src:PGstAppSrc; length:Tguint; user_data:Tgpointer);cdecl;
      enough_data : procedure (src:PGstAppSrc; user_data:Tgpointer);cdecl;
      seek_data : function (src:PGstAppSrc; offset:Tguint64; user_data:Tgpointer):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  type
  PGstAppStreamType = ^TGstAppStreamType;
  TGstAppStreamType =  Longint;
  Const
    GST_APP_STREAM_TYPE_STREAM = 0;
    GST_APP_STREAM_TYPE_SEEKABLE = 1;
    GST_APP_STREAM_TYPE_RANDOM_ACCESS = 2;

  type
  PGstAppLeakyType = ^TGstAppLeakyType;
  TGstAppLeakyType =  Longint;
  Const
    GST_APP_LEAKY_TYPE_NONE = 0;
    GST_APP_LEAKY_TYPE_UPSTREAM = 1;
    GST_APP_LEAKY_TYPE_DOWNSTREAM = 2;

  type
  PGstAppSrc = ^TGstAppSrc;
  TGstAppSrc = record
      basesrc : TGstBaseSrc;
      priv : PGstAppSrcPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  PGstAppSrcClass = ^TGstAppSrcClass;
  TGstAppSrcClass = record
      basesrc_class : TGstBaseSrcClass;
      need_data : procedure (appsrc:PGstAppSrc; length:Tguint);cdecl;
      enough_data : procedure (appsrc:PGstAppSrc);cdecl;
      seek_data : function (appsrc:PGstAppSrc; offset:Tguint64):Tgboolean;cdecl;
      push_buffer : function (appsrc:PGstAppSrc; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      end_of_stream : function (appsrc:PGstAppSrc):TGstFlowReturn;cdecl;
      push_sample : function (appsrc:PGstAppSrc; sample:PGstSample):TGstFlowReturn;cdecl;
      push_buffer_list : function (appsrc:PGstAppSrc; buffer_list:PGstBufferList):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;

function gst_app_src_get_type:TGType;cdecl;external libgstapp;
procedure gst_app_src_set_caps(appsrc:PGstAppSrc; caps:PGstCaps);cdecl;external libgstapp;
function gst_app_src_get_caps(appsrc:PGstAppSrc):PGstCaps;cdecl;external libgstapp;
procedure gst_app_src_set_size(appsrc:PGstAppSrc; size:Tgint64);cdecl;external libgstapp;
function gst_app_src_get_size(appsrc:PGstAppSrc):Tgint64;cdecl;external libgstapp;
procedure gst_app_src_set_duration(appsrc:PGstAppSrc; duration:TGstClockTime);cdecl;external libgstapp;
function gst_app_src_get_duration(appsrc:PGstAppSrc):TGstClockTime;cdecl;external libgstapp;
procedure gst_app_src_set_stream_type(appsrc:PGstAppSrc; _type:TGstAppStreamType);cdecl;external libgstapp;
function gst_app_src_get_stream_type(appsrc:PGstAppSrc):TGstAppStreamType;cdecl;external libgstapp;
procedure gst_app_src_set_max_bytes(appsrc:PGstAppSrc; max:Tguint64);cdecl;external libgstapp;
function gst_app_src_get_max_bytes(appsrc:PGstAppSrc):Tguint64;cdecl;external libgstapp;
function gst_app_src_get_current_level_bytes(appsrc:PGstAppSrc):Tguint64;cdecl;external libgstapp;
procedure gst_app_src_set_max_buffers(appsrc:PGstAppSrc; max:Tguint64);cdecl;external libgstapp;
function gst_app_src_get_max_buffers(appsrc:PGstAppSrc):Tguint64;cdecl;external libgstapp;
function gst_app_src_get_current_level_buffers(appsrc:PGstAppSrc):Tguint64;cdecl;external libgstapp;
procedure gst_app_src_set_max_time(appsrc:PGstAppSrc; max:TGstClockTime);cdecl;external libgstapp;
function gst_app_src_get_max_time(appsrc:PGstAppSrc):TGstClockTime;cdecl;external libgstapp;
function gst_app_src_get_current_level_time(appsrc:PGstAppSrc):TGstClockTime;cdecl;external libgstapp;
procedure gst_app_src_set_leaky_type(appsrc:PGstAppSrc; leaky:TGstAppLeakyType);cdecl;external libgstapp;
function gst_app_src_get_leaky_type(appsrc:PGstAppSrc):TGstAppLeakyType;cdecl;external libgstapp;
procedure gst_app_src_set_latency(appsrc:PGstAppSrc; min:Tguint64; max:Tguint64);cdecl;external libgstapp;
procedure gst_app_src_get_latency(appsrc:PGstAppSrc; min:Pguint64; max:Pguint64);cdecl;external libgstapp;
procedure gst_app_src_set_emit_signals(appsrc:PGstAppSrc; emit:Tgboolean);cdecl;external libgstapp;
function gst_app_src_get_emit_signals(appsrc:PGstAppSrc):Tgboolean;cdecl;external libgstapp;
function gst_app_src_push_buffer(appsrc:PGstAppSrc; buffer:PGstBuffer):TGstFlowReturn;cdecl;external libgstapp;
function gst_app_src_push_buffer_list(appsrc:PGstAppSrc; buffer_list:PGstBufferList):TGstFlowReturn;cdecl;external libgstapp;
function gst_app_src_end_of_stream(appsrc:PGstAppSrc):TGstFlowReturn;cdecl;external libgstapp;
function gst_app_src_push_sample(appsrc:PGstAppSrc; sample:PGstSample):TGstFlowReturn;cdecl;external libgstapp;
procedure gst_app_src_set_callbacks(appsrc:PGstAppSrc; callbacks:PGstAppSrcCallbacks; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstapp;
procedure gst_app_src_set_simple_callbacks(appsrc:PGstAppSrc; cb:PGstAppSrcSimpleCallbacks);cdecl;external libgstapp;
{*
 * gst_app_src_simple_callbacks_get_type:
 *
 * Since: 1.28
  }
function gst_app_src_simple_callbacks_get_type:TGType;cdecl;external libgstapp;
{*
 * GST_TYPE_APP_SRC_SIMPLE_CALLBACKS:
 *
 * Since: 1.28
  }
{ was #define dname def_expr }
function GST_TYPE_APP_SRC_SIMPLE_CALLBACKS : longint; { return type might be wrong }

function gst_app_src_simple_callbacks_new:PGstAppSrcSimpleCallbacks;cdecl;external libgstapp;
function gst_app_src_simple_callbacks_ref(cb:PGstAppSrcSimpleCallbacks):PGstAppSrcSimpleCallbacks;cdecl;external libgstapp;
procedure gst_app_src_simple_callbacks_unref(cb:PGstAppSrcSimpleCallbacks);cdecl;external libgstapp;
{*
 * GstAppSrcNeedDataCallback:
 * @appsrc: a #GstAppSrc
 * @length: Length hint
 * @user_data: callback user data
 *
 * Called when the appsrc needs more data. A buffer or EOS should be pushed to
 * appsrc from this thread or another thread. @length is just a hint and when it
 * is set to -1, any number of bytes can be pushed into @appsrc.
 *
 * Since: 1.28
  }
type

  TGstAppSrcNeedDataCallback = procedure (appsrc:PGstAppSrc; length:Tguint; user_data:Tgpointer);cdecl;

procedure gst_app_src_simple_callbacks_set_need_data(cb:PGstAppSrcSimpleCallbacks; need_data_cb:TGstAppSrcNeedDataCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgstapp;
{*
 * GstAppSrcEnoughDataCallback:
 * @appsrc: a #GstAppSrc
 * @user_data: callback user data
 *
 * Called when appsrc has enough data. It is recommended that the application
 * stops calling push-buffer until the need_data callback is emitted again to
 * avoid excessive buffer queueing.
 *
 * Since: 1.28
  }
type

  TGstAppSrcEnoughDataCallback = procedure (appsrc:PGstAppSrc; user_data:Tgpointer);cdecl;

procedure gst_app_src_simple_callbacks_set_enough_data(cb:PGstAppSrcSimpleCallbacks; enough_data_cb:TGstAppSrcEnoughDataCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgstapp;
{*
 * GstAppSrcSeekDataCallback:
 * @appsrc: a #GstAppSrc
 * @offset: Offset to seek to.
 * @user_data: callback user data
 *
 * Called when a seek should be performed to the offset. The next push-buffer
 * should produce buffers from the new @offset. This callback is only called for
 * seekable stream types.
 *
 * Returns: %TRUE if the seek was successful.
 *
 * Since: 1.28
  }
type

  TGstAppSrcSeekDataCallback = function (appsrc:PGstAppSrc; offset:Tguint64; user_data:Tgpointer):Tgboolean;cdecl;

procedure gst_app_src_simple_callbacks_set_seek_data(cb:PGstAppSrcSimpleCallbacks; seek_data_cb:TGstAppSrcSeekDataCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external libgstapp;
{//////////////////////////////////////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                                  (GstAppSrc, gst_object_unref) }
{//////////////////////////////////////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                                  (GstAppSrcSimpleCallbacks, gst_app_src_simple_callbacks_unref) }
{$endif}

// === Konventiert am: 26-7-26 20:05:19 ===

function GST_TYPE_APP_SRC : TGType;
function GST_APP_SRC(obj : Pointer) : PGstAppSrc;
function GST_APP_SRC_CLASS(klass : Pointer) : PGstAppSrcClass;
function GST_IS_APP_SRC(obj : Pointer) : Tgboolean;
function GST_IS_APP_SRC_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_APP_SRC : TGType;
  begin
    GST_TYPE_APP_SRC:=gst_app_src_get_type;
  end;

function GST_APP_SRC(obj : Pointer) : PGstAppSrc;
begin
  Result := PGstAppSrc(g_type_check_instance_cast(obj, GST_TYPE_APP_SRC));
end;

function GST_APP_SRC_CLASS(klass : Pointer) : PGstAppSrcClass;
begin
  Result := PGstAppSrcClass(g_type_check_class_cast(klass, GST_TYPE_APP_SRC));
end;

function GST_IS_APP_SRC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_APP_SRC);
end;

function GST_IS_APP_SRC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_APP_SRC);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_APP_SRC_CAST(obj : longint) : PGstAppSrc;
begin
  GST_APP_SRC_CAST:=PGstAppSrc(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_APP_SRC_SIMPLE_CALLBACKS : longint; { return type might be wrong }
  begin
    GST_TYPE_APP_SRC_SIMPLE_CALLBACKS:=gst_app_src_simple_callbacks_get_type;
  end;


end.
