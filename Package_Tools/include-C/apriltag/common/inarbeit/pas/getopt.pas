unit getopt;

interface

uses
  fp_apriltag, zarray;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pgetopt_t = type Pointer;

function getopt_create: Pgetopt_t; cdecl; external libapriltag;
procedure getopt_destroy(gopt: Pgetopt_t); cdecl; external libapriltag;
function getopt_parse(gopt: Pgetopt_t; argc: longint; argv: PPchar; showErrors: longint): longint; cdecl; external libapriltag;
procedure getopt_do_usage(gopt: Pgetopt_t); cdecl; external libapriltag;
function getopt_get_usage(gopt: Pgetopt_t): pchar; cdecl; external libapriltag;
procedure getopt_add_spacer(gopt: Pgetopt_t; s: pchar); cdecl; external libapriltag;
procedure getopt_add_bool(gopt: Pgetopt_t; sopt: char; lname: pchar; def: longint; help: pchar); cdecl; external libapriltag;
procedure getopt_add_int(gopt: Pgetopt_t; sopt: char; lname: pchar; def: pchar; help: pchar); cdecl; external libapriltag;
procedure getopt_add_string(gopt: Pgetopt_t; sopt: char; lname: pchar; def: pchar; help: pchar); cdecl; external libapriltag;
procedure getopt_add_double(gopt: Pgetopt_t; sopt: char; lname: pchar; def: pchar; help: pchar); cdecl; external libapriltag;
function getopt_get_string(gopt: Pgetopt_t; lname: pchar): pchar; cdecl; external libapriltag;
function getopt_get_int(getopt: Pgetopt_t; lname: pchar): longint; cdecl; external libapriltag;
function getopt_get_bool(getopt: Pgetopt_t; lname: pchar): longint; cdecl; external libapriltag;
function getopt_get_double(getopt: Pgetopt_t; lname: pchar): Tdouble; cdecl; external libapriltag;
function getopt_was_specified(gopt: Pgetopt_t; lname: pchar): longint; cdecl; external libapriltag;
function getopt_get_extra_args(gopt: Pgetopt_t): Pzarray_t; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:14:22 ===


implementation



end.
