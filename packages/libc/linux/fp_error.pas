unit fp_error;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/error.h


procedure error(__status: longint; __errnum: longint; __format: pchar); cdecl; varargs; external libc;
procedure error_at_line(__status: longint; __errnum: longint; __fname: pchar; __lineno: dword; __format: pchar); cdecl; varargs; external libc;

var
  error_print_progname: procedure; cvar;external libc;
  error_message_count: dword; cvar;external libc;
  error_one_per_line: longint; cvar;external libc;

  // === Konventiert am: 22-7-25 19:03:50 ===


implementation



end.
