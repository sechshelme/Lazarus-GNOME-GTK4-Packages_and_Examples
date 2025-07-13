
unit pam_ext;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_ext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_ext.h
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
 * Copyright (C) 2005, 2006, 2008, 2009 Thorsten Kukuk.
 *
 * <security/pam_ext.h>
 *
 * This header file collects definitions for the extended PAM API.
 * This is a public interface of the PAM library for PAM modules,
 * which makes the life of PAM developers easier, but are not documented
 * in any standard and are not portable between different PAM
 * implementations.
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
{$ifndef _SECURITY__PAM_EXT_H_}
{$define _SECURITY__PAM_EXT_H_}
{ C++ extern C conditionnal removed }
{$include <security/_pam_types.h>}
{$include <stdarg.h>}
(* Const before type ignored *)
(* Const before type ignored *)

procedure pam_vsyslog(pamh:Ppam_handle_t; priority:longint; fmt:Pchar; args:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure pam_syslog(pamh:Ppam_handle_t; priority:longint; fmt:Pchar; args:array of const);cdecl;external;
procedure pam_syslog(pamh:Ppam_handle_t; priority:longint; fmt:Pchar);cdecl;external;
(* Const before type ignored *)
function pam_vprompt(pamh:Ppam_handle_t; style:longint; response:PPchar; fmt:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function pam_prompt(pamh:Ppam_handle_t; style:longint; response:PPchar; fmt:Pchar; args:array of const):longint;cdecl;external;
function pam_prompt(pamh:Ppam_handle_t; style:longint; response:PPchar; fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_get_authtok(pamh:Ppam_handle_t; item:longint; authtok:PPchar; prompt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_get_authtok_noverify(pamh:Ppam_handle_t; authtok:PPchar; prompt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_get_authtok_verify(pamh:Ppam_handle_t; authtok:PPchar; prompt:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
