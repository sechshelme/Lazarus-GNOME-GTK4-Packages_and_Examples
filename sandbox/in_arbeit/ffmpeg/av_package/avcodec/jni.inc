{$IFDEF read_interface}


function av_jni_set_java_vm(vm: pointer; log_ctx: pointer): longint; cdecl; external libavcodec;
function av_jni_get_java_vm(log_ctx: pointer): pointer; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
