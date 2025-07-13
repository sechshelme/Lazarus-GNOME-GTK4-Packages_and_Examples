
unit pam_appl;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_appl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_appl.h
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
Ppam_conv  = ^pam_conv;
Ppam_handle_t  = ^pam_handle_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * <security/pam_appl.h>
 *
 * This header file collects definitions for the PAM API --- that is,
 * public interface between the PAM library and an application program
 * that wishes to use it.
 *
 * Note, the copyright information is at end of file.
  }
{$ifndef _SECURITY_PAM_APPL_H}
{$define _SECURITY_PAM_APPL_H}
{ C++ extern C conditionnal removed }
{$include <security/_pam_types.h>      /* Linux-PAM common defined types */}
{ -------------- The Linux-PAM Framework layer API -------------  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function pam_start(service_name:Pchar; user:Pchar; pam_conversation:Ppam_conv; pamh:PPpam_handle_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function pam_start_confdir(service_name:Pchar; user:Pchar; pam_conversation:Ppam_conv; confdir:Pchar; pamh:PPpam_handle_t):longint;cdecl;external;
function pam_end(pamh:Ppam_handle_t; pam_status:longint):longint;cdecl;external;
{ Authentication API's  }
function pam_authenticate(pamh:Ppam_handle_t; flags:longint):longint;cdecl;external;
function pam_setcred(pamh:Ppam_handle_t; flags:longint):longint;cdecl;external;
{ Account Management API's  }
function pam_acct_mgmt(pamh:Ppam_handle_t; flags:longint):longint;cdecl;external;
{ Session Management API's  }
function pam_open_session(pamh:Ppam_handle_t; flags:longint):longint;cdecl;external;
function pam_close_session(pamh:Ppam_handle_t; flags:longint):longint;cdecl;external;
{ Password Management API's  }
function pam_chauthtok(pamh:Ppam_handle_t; flags:longint):longint;cdecl;external;
{ take care of any compatibility issues  }
{$include <security/_pam_compat.h>}
{ C++ end of extern C conditionnal removed }
{
 * Copyright Theodore Ts'o, 1996.  All rights reserved.
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
 * the GNU Public License, in which case the provisions of the GPL are
 * required INSTEAD OF the above restrictions.  (This clause is
 * necessary due to a potential bad interaction between the GPL and
 * the restrictions contained in a BSD-style copyright.)
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
 * OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$endif}
{ _SECURITY_PAM_APPL_H  }

implementation


end.
