

  {$IFDEF read_struct}
type
  PGstPlanarAudioAdapter = type Pointer;
  PGstPlanarAudioAdapterClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_planar_audio_adapter_get_type: TGType; cdecl; external libgstaudio;
function gst_planar_audio_adapter_new: PGstPlanarAudioAdapter; cdecl; external libgstaudio;
procedure gst_planar_audio_adapter_configure(adapter: PGstPlanarAudioAdapter; info: PGstAudioInfo); cdecl; external libgstaudio;
procedure gst_planar_audio_adapter_clear(adapter: PGstPlanarAudioAdapter); cdecl; external libgstaudio;
procedure gst_planar_audio_adapter_push(adapter: PGstPlanarAudioAdapter; buf: PGstBuffer); cdecl; external libgstaudio;
procedure gst_planar_audio_adapter_flush(adapter: PGstPlanarAudioAdapter; to_flush: Tgsize); cdecl; external libgstaudio;
function gst_planar_audio_adapter_get_buffer(adapter: PGstPlanarAudioAdapter; nsamples: Tgsize; flags: TGstMapFlags): PGstBuffer; cdecl; external libgstaudio;
function gst_planar_audio_adapter_take_buffer(adapter: PGstPlanarAudioAdapter; nsamples: Tgsize; flags: TGstMapFlags): PGstBuffer; cdecl; external libgstaudio;
function gst_planar_audio_adapter_available(adapter: PGstPlanarAudioAdapter): Tgsize; cdecl; external libgstaudio;
function gst_planar_audio_adapter_distance_from_discont(adapter: PGstPlanarAudioAdapter): Tguint64; cdecl; external libgstaudio;
function gst_planar_audio_adapter_offset_at_discont(adapter: PGstPlanarAudioAdapter): Tguint64; cdecl; external libgstaudio;
function gst_planar_audio_adapter_pts_at_discont(adapter: PGstPlanarAudioAdapter): TGstClockTime; cdecl; external libgstaudio;
function gst_planar_audio_adapter_dts_at_discont(adapter: PGstPlanarAudioAdapter): TGstClockTime; cdecl; external libgstaudio;
function gst_planar_audio_adapter_prev_offset(adapter: PGstPlanarAudioAdapter; distance: Pguint64): Tguint64; cdecl; external libgstaudio;
function gst_planar_audio_adapter_prev_pts(adapter: PGstPlanarAudioAdapter; distance: Pguint64): TGstClockTime; cdecl; external libgstaudio;
function gst_planar_audio_adapter_prev_dts(adapter: PGstPlanarAudioAdapter; distance: Pguint64): TGstClockTime; cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:25:58 ===

function GST_TYPE_PLANAR_AUDIO_ADAPTER: TGType;
function GST_PLANAR_AUDIO_ADAPTER(obj: Pointer): PGstPlanarAudioAdapter;
function GST_PLANAR_AUDIO_ADAPTER_CLASS(klass: Pointer): PGstPlanarAudioAdapterClass;
function GST_IS_PLANAR_AUDIO_ADAPTER(obj: Pointer): Tgboolean;
function GST_IS_PLANAR_AUDIO_ADAPTER_CLASS(klass: Pointer): Tgboolean;
function GST_PLANAR_AUDIO_ADAPTER_GET_CLASS(obj: Pointer): PGstPlanarAudioAdapterClass;
{$ENDIF read_struct}


{$IFDEF read_implementation}

function GST_TYPE_PLANAR_AUDIO_ADAPTER: TGType;
begin
  GST_TYPE_PLANAR_AUDIO_ADAPTER := gst_planar_audio_adapter_get_type;
end;

function GST_PLANAR_AUDIO_ADAPTER(obj: Pointer): PGstPlanarAudioAdapter;
begin
  Result := PGstPlanarAudioAdapter(g_type_check_instance_cast(obj, GST_TYPE_PLANAR_AUDIO_ADAPTER));
end;

function GST_PLANAR_AUDIO_ADAPTER_CLASS(klass: Pointer): PGstPlanarAudioAdapterClass;
begin
  Result := PGstPlanarAudioAdapterClass(g_type_check_class_cast(klass, GST_TYPE_PLANAR_AUDIO_ADAPTER));
end;

function GST_IS_PLANAR_AUDIO_ADAPTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLANAR_AUDIO_ADAPTER);
end;

function GST_IS_PLANAR_AUDIO_ADAPTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLANAR_AUDIO_ADAPTER);
end;

function GST_PLANAR_AUDIO_ADAPTER_GET_CLASS(obj: Pointer): PGstPlanarAudioAdapterClass;
begin
  Result := PGstPlanarAudioAdapterClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
