
unit pam_modules;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_modules.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_modules.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * <security/pam_modules.h>
 *
 * This header file collects definitions for the PAM API --- that is,
 * public interface between the PAM library and PAM modules.
 *
 * Note, the copyright information is at end of file.
  }
{$ifndef _SECURITY_PAM_MODULES_H}
{$define _SECURITY_PAM_MODULES_H}
{ C++ extern C conditionnal removed }
{$include <security/_pam_types.h>      /* Linux-PAM common defined types */}
{ -------------- The Linux-PAM Module PI -------------  }
(* Const before type ignored *)

function pam_set_data(pamh:Ppam_handle_t; module_data_name:Pchar; data:pointer; cleanup:procedure (pamh:Ppam_handle_t; data:pointer; error_status:longint)):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function pam_get_data(pamh:Ppam_handle_t; module_data_name:Pchar; data:Ppointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_get_user(pamh:Ppam_handle_t; user:PPchar; prompt:Pchar):longint;cdecl;external;
{ Authentication API's  }
(* Const before type ignored *)
function pam_sm_authenticate(pamh:Ppam_handle_t; flags:longint; argc:longint; argv:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function pam_sm_setcred(pamh:Ppam_handle_t; flags:longint; argc:longint; argv:PPchar):longint;cdecl;external;
{ Account Management API's  }
(* Const before type ignored *)
function pam_sm_acct_mgmt(pamh:Ppam_handle_t; flags:longint; argc:longint; argv:PPchar):longint;cdecl;external;
{ Session Management API's  }
(* Const before type ignored *)
function pam_sm_open_session(pamh:Ppam_handle_t; flags:longint; argc:longint; argv:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function pam_sm_close_session(pamh:Ppam_handle_t; flags:longint; argc:longint; argv:PPchar):longint;cdecl;external;
{ Password Management API's  }
(* Const before type ignored *)
function pam_sm_chauthtok(pamh:Ppam_handle_t; flags:longint; argc:longint; argv:PPchar):longint;cdecl;external;
{ The following two flags are for use across the Linux-PAM/module
 * interface only. The Application is not permitted to use these
 * tokens.
 *
 * The password service should only perform preliminary checks.  No
 * passwords should be updated.  }
const
  PAM_PRELIM_CHECK = $4000;  
{ The password service should update passwords Note: PAM_PRELIM_CHECK
 * and PAM_UPDATE_AUTHTOK cannot both be set simultaneously!  }
  PAM_UPDATE_AUTHTOK = $2000;  
{
 * here are some proposed error status definitions for the
 * 'error_status' argument used by the cleanup function associated
 * with data items they should be logically OR'd with the error_status
 * of the latest return from libpam -- new with .52 and positive
 * impression from Sun although not official as of 1996/9/4 there are
 * others in _pam_types.h -- they are for common module/app use.
  }
{ used when replacing a data item  }
  PAM_DATA_REPLACE = $20000000;  
{ PAM_EXTERN isn't needed anymore, but don't remove it to not break
   lot of external code using it.  }
{ take care of any compatibility issues  }
{$include <security/_pam_compat.h>}
{ C++ end of extern C conditionnal removed }
{ Copyright (C) Theodore Ts'o, 1996.
 * Copyright (C) Andrew Morgan, 1996-8.
 *                                                All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, and the entire permission notice in its entirety,
 *    including the disclaimer of warranties.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote
 *    products derived from this software without specific prior
 *    written permission.
 *
 * ALTERNATIVELY, this product may be distributed under the terms of
 * the GNU General Public License, in which case the provisions of the
 * GNU GPL are required INSTEAD OF the above restrictions.  (This
 * clause is necessary due to a potential bad interaction between the
 * GNU GPL and the restrictions contained in a BSD-style copyright.)
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.   }
{$endif}
{ _SECURITY_PAM_MODULES_H  }

implementation


end.
