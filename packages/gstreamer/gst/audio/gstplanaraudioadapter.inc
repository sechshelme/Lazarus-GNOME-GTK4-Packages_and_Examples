/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPlanarAudioAdapter = record
  end;
  PGstPlanarAudioAdapter = ^TGstPlanarAudioAdapter;

  TGstPlanarAudioAdapterClass = record
  end;
  PGstPlanarAudioAdapterClass = ^TGstPlanarAudioAdapterClass;

function gst_planar_audio_adapter_get_type: TGType; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_new: PGstPlanarAudioAdapter; cdecl; external libgstbadaudio;
procedure gst_planar_audio_adapter_configure(adapter: PGstPlanarAudioAdapter; info: PGstAudioInfo); cdecl; external libgstbadaudio;
procedure gst_planar_audio_adapter_clear(adapter: PGstPlanarAudioAdapter); cdecl; external libgstbadaudio;
procedure gst_planar_audio_adapter_push(adapter: PGstPlanarAudioAdapter; buf: PGstBuffer); cdecl; external libgstbadaudio;
procedure gst_planar_audio_adapter_flush(adapter: PGstPlanarAudioAdapter; to_flush: Tgsize); cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_get_buffer(adapter: PGstPlanarAudioAdapter; nsamples: Tgsize; flags: TGstMapFlags): PGstBuffer; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_take_buffer(adapter: PGstPlanarAudioAdapter; nsamples: Tgsize; flags: TGstMapFlags): PGstBuffer; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_available(adapter: PGstPlanarAudioAdapter): Tgsize; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_distance_from_discont(adapter: PGstPlanarAudioAdapter): Tguint64; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_offset_at_discont(adapter: PGstPlanarAudioAdapter): Tguint64; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_pts_at_discont(adapter: PGstPlanarAudioAdapter): TGstClockTime; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_dts_at_discont(adapter: PGstPlanarAudioAdapter): TGstClockTime; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_prev_offset(adapter: PGstPlanarAudioAdapter; distance: Pguint64): Tguint64; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_prev_pts(adapter: PGstPlanarAudioAdapter; distance: Pguint64): TGstClockTime; cdecl; external libgstbadaudio;
function gst_planar_audio_adapter_prev_dts(adapter: PGstPlanarAudioAdapter; distance: Pguint64): TGstClockTime; cdecl; external libgstbadaudio;

// === Konventiert am: 28-9-24 19:33:41 ===

function GST_TYPE_PLANAR_AUDIO_ADAPTER: TGType;
function GST_PLANAR_AUDIO_ADAPTER(obj: Pointer): PGstPlanarAudioAdapter;
function GST_PLANAR_AUDIO_ADAPTER_CLASS(klass: Pointer): PGstPlanarAudioAdapterClass;
function GST_IS_PLANAR_AUDIO_ADAPTER(obj: Pointer): Tgboolean;
function GST_IS_PLANAR_AUDIO_ADAPTER_CLASS(klass: Pointer): Tgboolean;
function GST_PLANAR_AUDIO_ADAPTER_GET_CLASS(obj: Pointer): PGstPlanarAudioAdapterClass;

{$ENDIF read_interface}


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
