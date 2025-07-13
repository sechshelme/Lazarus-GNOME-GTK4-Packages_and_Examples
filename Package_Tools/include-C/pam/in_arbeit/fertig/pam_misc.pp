
unit pam_misc;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_misc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_misc.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Ppam_handle_t  = ^pam_handle_t;
Ppam_message  = ^pam_message;
Ppam_response  = ^pam_response;
Ppamc_bp_t  = ^pamc_bp_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$  }
{$ifndef __PAMMISC_H}
{$define __PAMMISC_H}
{$include <security/pam_appl.h>}
{$include <security/pam_client.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{ include some useful macros  }
{$include <security/_pam_macros.h>}
{ functions defined in pam_misc.* libraries  }
(* Const before type ignored *)

function misc_conv(num_msg:longint; msgm:PPpam_message; response:PPpam_response; appdata_ptr:pointer):longint;cdecl;external;
{$include <time.h>}
  var
    pam_misc_conv_warn_time : Ttime_t;cvar;external;
{ time that we should warn user  }
    pam_misc_conv_die_time : Ttime_t;cvar;external;
{ cut-off time for input  }
(* Const before type ignored *)
    pam_misc_conv_warn_line : Pchar;cvar;external;
{ warning notice  }
(* Const before type ignored *)
    pam_misc_conv_die_line : Pchar;cvar;external;
{ cut-off remark  }
    pam_misc_conv_died : longint;cvar;external;
{ 1 = cut-off time reached (0 not)  }
    pam_binary_handler_fn : function (appdata:pointer; prompt_p:Ppamc_bp_t):longint;cvar;external;
    pam_binary_handler_free : procedure (appdata:pointer; prompt_p:Ppamc_bp_t);cvar;external;
{
 * Environment helper functions
  }
{ transcribe given environment (to pam)  }
(* Const before type ignored *)
(* Const before declarator ignored *)

function pam_misc_paste_env(pamh:Ppam_handle_t; user_env:PPchar):longint;cdecl;external;
{ delete environment as obtained from (pam_getenvlist)  }
function pam_misc_drop_env(env:PPchar):^Pchar;cdecl;external;
{ provide something like the POSIX setenv function for the (Linux-)PAM
 * environment.  }
(* Const before type ignored *)
(* Const before type ignored *)
function pam_misc_setenv(pamh:Ppam_handle_t; name:Pchar; value:Pchar; readonly:longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ def __cplusplus  }
{$endif}
{ ndef __PAMMISC_H  }

implementation


end.
