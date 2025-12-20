unit jni;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function av_jni_set_java_vm(vm: pointer; log_ctx: pointer): longint; cdecl; external libavcodec;
function av_jni_get_java_vm(log_ctx: pointer): pointer; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:07 ===


implementation



end.
