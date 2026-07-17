

{$IFDEF read_function}
function gst_audio_iec61937_frame_size(spec: PGstAudioRingBufferSpec): Tguint; cdecl; external libgstaudio;
function gst_audio_iec61937_payload(src: Pguint8; src_n: Tguint; dst: Pguint8; dst_n: Tguint; spec: PGstAudioRingBufferSpec;
  endianness: Tgint): Tgboolean; cdecl; external libgstaudio;
{$ENDIF read_function}

// === Konventiert am: 16-7-26 15:16:49 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
