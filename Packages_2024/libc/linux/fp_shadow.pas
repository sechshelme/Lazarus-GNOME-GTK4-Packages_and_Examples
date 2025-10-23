unit fp_shadow;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tspwd = record
    sp_namp: pchar;
    sp_pwdp: pchar;
    sp_lstchg: longint;
    sp_min: longint;
    sp_max: longint;
    sp_warn: longint;
    sp_inact: longint;
    sp_expire: longint;
    sp_flag: dword;
  end;
  Pspwd = ^Tspwd;
  PPspwd = ^Pspwd;

procedure setspent; cdecl; external libc;
procedure endspent; cdecl; external libc;
function getspent: Pspwd; cdecl; external libc;
function getspnam(__name: pchar): Pspwd; cdecl; external libc;
function sgetspent(__string: pchar): Pspwd; cdecl; external libc;
function fgetspent(__stream: PFILE): Pspwd; cdecl; external libc;
function putspent(__p: Pspwd; __stream: PFILE): longint; cdecl; external libc;

function getspent_r(__result_buf: Pspwd; __buffer: pchar; __buflen: Tsize_t; __result: PPspwd): longint; cdecl; external libc;
function getspnam_r(__name: pchar; __result_buf: Pspwd; __buffer: pchar; __buflen: Tsize_t; __result: PPspwd): longint; cdecl; external libc;
function sgetspent_r(__string: pchar; __result_buf: Pspwd; __buffer: pchar; __buflen: Tsize_t; __result: PPspwd): longint; cdecl; external libc;
function fgetspent_r(__stream: PFILE; __result_buf: Pspwd; __buffer: pchar; __buflen: Tsize_t; __result: PPspwd): longint; cdecl; external libc;

function lckpwdf: longint; cdecl; external libc;
function ulckpwdf: longint; cdecl; external libc;

// === Konventiert am: 16-7-25 16:16:16 ===


implementation



end.
