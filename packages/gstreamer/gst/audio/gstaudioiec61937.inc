/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_audio_iec61937_frame_size(spec: PGstAudioRingBufferSpec): Tguint; cdecl; external libgstaudio;
function gst_audio_iec61937_payload(src: Pguint8; src_n: Tguint; dst: Pguint8; dst_n: Tguint; spec: PGstAudioRingBufferSpec;
  endianness: Tgint): Tgboolean; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 20:07:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
