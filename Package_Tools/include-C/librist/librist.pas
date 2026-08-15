unit librist;

interface

uses
  fp_rist, headers;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function rist_jitter_max_set(ctx: Prist_ctx; t: longint): longint; cdecl; external fp_rist.librist;
function rist_start(ctx: Prist_ctx): longint; cdecl; external fp_rist.librist;
function rist_destroy(ctx: Prist_ctx): longint; cdecl; external fp_rist.librist;
function rist_parse_udp_address(url: pchar; peer_config: PPrist_udp_config): longint; cdecl; external fp_rist.librist; deprecated;
function rist_parse_udp_address2(url: pchar; peer_config: PPrist_udp_config): longint; cdecl; external fp_rist.librist;
function rist_udp_config_free(udp_config: PPrist_udp_config): longint; cdecl; external fp_rist.librist; deprecated;
function rist_udp_config_free2(udp_config: PPrist_udp_config): longint; cdecl; external fp_rist.librist;
function librist_version: pchar; cdecl; external fp_rist.librist;
function librist_api_version: pchar; cdecl; external fp_rist.librist;

// === Konventiert am: 15-8-26 19:17:10 ===


implementation



end.
