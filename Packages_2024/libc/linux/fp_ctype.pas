unit fp_ctype;

interface

uses
  clib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  _ISupper = $0100;
  _ISlower = $0200;
  _ISalpha = $0400;
  _ISdigit = $0800;
  _ISxdigit = $1000;
  _ISspace = $2000;
  _ISprint = $4000;
  _ISgraph = $8000;
  _ISblank = $0001;
  _IScntrl = $0002;
  _ISpunct = $0004;
  _ISalnum = $0800;

function __ctype_b_loc:PPuint16;cdecl;external libc;
function __ctype_tolower_loc:PPint32;cdecl;external libc;
function __ctype_toupper_loc:PPint32;cdecl;external libc;


function isalnum(c: Integer): Integer; cdecl; external libc;
function isalpha(c: Integer): Integer; cdecl; external libc;
function iscntrl(c: Integer): Integer; cdecl; external libc;
function isdigit(c: Integer): Integer; cdecl; external libc;
function islower(c: Integer): Integer; cdecl; external libc;
function isgraph(c: Integer): Integer; cdecl; external libc;
function isprint(c: Integer): Integer; cdecl; external libc;
function ispunct(c: Integer): Integer; cdecl; external libc;
function isspace(c: Integer): Integer; cdecl; external libc;
function isupper(c: Integer): Integer; cdecl; external libc;
function isxdigit(c: Integer): Integer; cdecl; external libc;
function isblank(c: Integer): Integer; cdecl; external libc;

function tolower(__c:longint):longint;cdecl;external libc;
function toupper(__c:longint):longint;cdecl;external libc;

function isctype(__c:longint; __mask:longint):longint;cdecl;external libc;
function isascii(__c:longint):longint;cdecl;external libc;
function toascii(__c:longint):longint;cdecl;external libc;

function isalnum_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isalpha_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function iscntrl_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isdigit_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function islower_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isgraph_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isprint_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function ispunct_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isspace_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isupper_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isxdigit_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;
function isblank_l(c: Integer; l: Tlocale_t): Integer; cdecl; external libc;


// === Konventiert am: 5-8-25 14:44:22 ===


implementation



end.
