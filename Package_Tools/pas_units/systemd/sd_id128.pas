unit sd_id128;

interface

uses
  fp_systemd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psd_id128 = ^Tsd_id128;
  //Tsd_id128 = record
  //  case longint of
  //    0: (bytes: array[0..15] of Char);
  //    1: (qwords: array[0..1] of uint64);
  //end;
  Tsd_id128 = array[0..15] of byte;

  Psd_id128_t = ^Tsd_id128_t;
  Tsd_id128_t = Tsd_id128;


const
  SD_ID128_STRING_MAX = 33;
  SD_ID128_UUID_STRING_MAX = 37;

function sd_id128_to_string(id: Tsd_id128_t; s: pchar): pchar; cdecl; external libsystemd;
function sd_id128_to_uuid_string(id: Tsd_id128_t; s: pchar): pchar; cdecl; external libsystemd;
function sd_id128_from_string(s: pchar; ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_randomize(ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_get_machine(ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_get_boot(ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_get_invocation(ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_get_app_specific(base: Tsd_id128_t; app_id: Tsd_id128_t; ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_get_machine_app_specific(app_id: Tsd_id128_t; ret: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_id128_get_boot_app_specific(app_id: Tsd_id128_t; ret: Psd_id128_t): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:04:07 ===


implementation



end.
