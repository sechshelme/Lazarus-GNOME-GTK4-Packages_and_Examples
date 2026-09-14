${$IFDEF read_interface}


type
  Pgetopt_t = type Pointer;

function getopt_create: Pgetopt_t; cdecl; external libapriltag_utils;
procedure getopt_destroy(gopt: Pgetopt_t); cdecl; external libapriltag_utils;
function getopt_parse(gopt: Pgetopt_t; argc: longint; argv: PPchar; showErrors: longint): longint; cdecl; external libapriltag_utils;
procedure getopt_do_usage(gopt: Pgetopt_t); cdecl; external libapriltag_utils;
function getopt_get_usage(gopt: Pgetopt_t): pchar; cdecl; external libapriltag_utils;
procedure getopt_add_spacer(gopt: Pgetopt_t; s: pchar); cdecl; external libapriltag_utils;
procedure getopt_add_bool(gopt: Pgetopt_t; sopt: char; lname: pchar; def: longint; help: pchar); cdecl; external libapriltag_utils;
procedure getopt_add_int(gopt: Pgetopt_t; sopt: char; lname: pchar; def: pchar; help: pchar); cdecl; external libapriltag_utils;
procedure getopt_add_string(gopt: Pgetopt_t; sopt: char; lname: pchar; def: pchar; help: pchar); cdecl; external libapriltag_utils;
procedure getopt_add_double(gopt: Pgetopt_t; sopt: char; lname: pchar; def: pchar; help: pchar); cdecl; external libapriltag_utils;
function getopt_get_string(gopt: Pgetopt_t; lname: pchar): pchar; cdecl; external libapriltag_utils;
function getopt_get_int(getopt: Pgetopt_t; lname: pchar): longint; cdecl; external libapriltag_utils;
function getopt_get_bool(getopt: Pgetopt_t; lname: pchar): longint; cdecl; external libapriltag_utils;
function getopt_get_double(getopt: Pgetopt_t; lname: pchar): Tdouble; cdecl; external libapriltag_utils;
function getopt_was_specified(gopt: Pgetopt_t; lname: pchar): longint; cdecl; external libapriltag_utils;
function getopt_get_extra_args(gopt: Pgetopt_t): Pzarray_t; cdecl; external libapriltag_utils;

// === Konventiert am: 12-9-26 17:14:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
