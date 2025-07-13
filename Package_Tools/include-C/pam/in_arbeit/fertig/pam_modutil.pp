
unit pam_modutil;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_modutil.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_modutil.h
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
Pgid_t  = ^gid_t;
Pgroup  = ^group;
Ppam_handle_t  = ^pam_handle_t;
Ppam_modutil_privs  = ^pam_modutil_privs;
Ppam_modutil_redirect_fd  = ^pam_modutil_redirect_fd;
Ppasswd  = ^passwd;
Pspwd  = ^spwd;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2001-2002 Andrew Morgan <morgan@kernel.org>
 *
 * <security/pam_modutil.h>
 *
 * This file is a list of handy libc wrappers that attempt to provide some
 * thread-safe and other convenient functionality to modules in a common form.
 *
 * A number of these functions reserve space in a pam_[sg]et_data item.
 * In all cases, the name of the item is prefixed with "pam_modutil_*".
 *
 * On systems that simply can't support thread safe programming, these
 * functions don't support it either - sorry.
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
{$ifndef _SECURITY__PAM_MODUTIL_H}
{$define _SECURITY__PAM_MODUTIL_H}
{$include <sys/types.h>}
{$include <pwd.h>}
{$include <grp.h>}
{$include <shadow.h>}
{ C++ extern C conditionnal removed }
{$include <security/_pam_types.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function pam_modutil_check_user_in_passwd(pamh:Ppam_handle_t; user_name:Pchar; file_name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pam_modutil_getpwnam(pamh:Ppam_handle_t; user:Pchar):Ppasswd;cdecl;external;
function pam_modutil_getpwuid(pamh:Ppam_handle_t; uid:Tuid_t):Ppasswd;cdecl;external;
(* Const before type ignored *)
function pam_modutil_getgrnam(pamh:Ppam_handle_t; group:Pchar):Pgroup;cdecl;external;
function pam_modutil_getgrgid(pamh:Ppam_handle_t; gid:Tgid_t):Pgroup;cdecl;external;
(* Const before type ignored *)
function pam_modutil_getspnam(pamh:Ppam_handle_t; user:Pchar):Pspwd;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_modutil_user_in_group_nam_nam(pamh:Ppam_handle_t; user:Pchar; group:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pam_modutil_user_in_group_nam_gid(pamh:Ppam_handle_t; user:Pchar; group:Tgid_t):longint;cdecl;external;
(* Const before type ignored *)
function pam_modutil_user_in_group_uid_nam(pamh:Ppam_handle_t; user:Tuid_t; group:Pchar):longint;cdecl;external;
function pam_modutil_user_in_group_uid_gid(pamh:Ppam_handle_t; user:Tuid_t; group:Tgid_t):longint;cdecl;external;
(* Const before type ignored *)
function pam_modutil_getlogin(pamh:Ppam_handle_t):Pchar;cdecl;external;
function pam_modutil_read(fd:longint; buffer:Pchar; count:longint):longint;cdecl;external;
(* Const before type ignored *)
function pam_modutil_write(fd:longint; buffer:Pchar; count:longint):longint;cdecl;external;
(* Const before type ignored *)
function pam_modutil_audit_write(pamh:Ppam_handle_t; _type:longint; message:Pchar; retval:longint):longint;cdecl;external;
type
  Ppam_modutil_privs = ^Tpam_modutil_privs;
  Tpam_modutil_privs = record
      grplist : Pgid_t;
      number_of_groups : longint;
      allocated : longint;
      old_gid : Tgid_t;
      old_uid : Tuid_t;
      is_dropped : longint;
    end;


const
  PAM_MODUTIL_NGROUPS = 64;  
(* Const before type ignored *)

function pam_modutil_drop_priv(pamh:Ppam_handle_t; p:Ppam_modutil_privs; pw:Ppasswd):longint;cdecl;external;
function pam_modutil_regain_priv(pamh:Ppam_handle_t; p:Ppam_modutil_privs):longint;cdecl;external;
{ do not redirect  }
{ redirect to a pipe  }
{ redirect to /dev/null  }
type
  Tpam_modutil_redirect_fd =  Longint;
  Const
    PAM_MODUTIL_IGNORE_FD = 0;
    PAM_MODUTIL_PIPE_FD = 1;
    PAM_MODUTIL_NULL_FD = 2;

{ redirect standard descriptors, close all other descriptors.  }

function pam_modutil_sanitize_helper_fds(pamh:Ppam_handle_t; redirect_stdin:Tpam_modutil_redirect_fd; redirect_stdout:Tpam_modutil_redirect_fd; redirect_stderr:Tpam_modutil_redirect_fd):longint;cdecl;external;
{*************************************************
 * @brief Lookup a value for the key in the file (i.e. login.defs or a similar
 * key-value format file).
 *
 * @param[in] pamh The pam handle structure
 * @param[in] file_name Configuration file name
 * @param[in] key Lookup key
 *
 * @return value, or NULL if key was not found.
 ************************************************* }
(* Const before type ignored *)
(* Const before type ignored *)
function pam_modutil_search_key(pamh:Ppam_handle_t; file_name:Pchar; key:Pchar):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ _SECURITY__PAM_MODUTIL_H  }

implementation


end.
