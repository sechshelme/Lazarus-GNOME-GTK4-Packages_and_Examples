  {$IFDEF read_interface}


const
  KHRONOS_SUPPORT_INT64 = 1;
  KHRONOS_SUPPORT_FLOAT = 1;

function epoxy_has_gl_extension(extension: pchar): Tbool; cdecl; external libepoxy;
function epoxy_is_desktop_gl: Tbool; cdecl; external libepoxy;
function epoxy_gl_version: longint; cdecl; external libepoxy;
function epoxy_glsl_version: longint; cdecl; external libepoxy;

type
  Tepoxy_resolver_stub_t = procedure(para1: pointer); cdecl;
  Tepoxy_resolver_failure_handler_t = function(name: pchar): Tepoxy_resolver_stub_t; cdecl;

function epoxy_set_resolver_failure_handler(handler: Tepoxy_resolver_failure_handler_t): Tepoxy_resolver_failure_handler_t; cdecl; external libepoxy;

// === Konventiert am: 4-5-26 15:03:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
