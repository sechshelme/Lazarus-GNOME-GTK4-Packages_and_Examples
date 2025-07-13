
unit _pam_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from _pam_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    _pam_types.h
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
Ppam_message  = ^pam_message;
Ppam_response  = ^pam_response;
Ppam_xauth_data  = ^pam_xauth_data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * <security/_pam_types.h>
 *
 * This file defines all of the types common to the Linux-PAM library
 * applications and modules.
 *
 * Note, the copyright+license information is at end of file.
  }
{$ifndef _SECURITY__PAM_TYPES_H}
{$define _SECURITY__PAM_TYPES_H}
{ This is a blind structure; users aren't allowed to see inside a
 * pam_handle_t, so we don't define struct pam_handle here.  This is
 * defined in a file private to the PAM library.  (i.e., it's private
 * to PAM service modules, too!)   }
type
  Tpam_handle = Tpam_handle_t;
{ ---------------- The Linux-PAM Version defines -----------------  }
{ Major and minor version number of the Linux-PAM package.  Use
   these macros to test for features in specific releases.   }

const
  __LINUX_PAM__ = 1;  
  __LINUX_PAM_MINOR__ = 0;  
{ ----------------- The Linux-PAM return values ------------------  }
{ Successful function return  }
  PAM_SUCCESS = 0;  
{ dlopen() failure when dynamically  }
  PAM_OPEN_ERR = 1;  
{ loading a service module  }
{ Symbol not found  }
  PAM_SYMBOL_ERR = 2;  
{ Error in service module  }
  PAM_SERVICE_ERR = 3;  
{ System error  }
  PAM_SYSTEM_ERR = 4;  
{ Memory buffer error  }
  PAM_BUF_ERR = 5;  
{ Permission denied  }
  PAM_PERM_DENIED = 6;  
{ Authentication failure  }
  PAM_AUTH_ERR = 7;  
{ Can not access authentication data  }
  PAM_CRED_INSUFFICIENT = 8;  
{ due to insufficient credentials  }
{ Underlying authentication service  }
  PAM_AUTHINFO_UNAVAIL = 9;  
{ can not retrieve authentication  }
{ information   }
{ User not known to the underlying  }
  PAM_USER_UNKNOWN = 10;  
{ authentication module  }
{ An authentication service has  }
  PAM_MAXTRIES = 11;  
{ maintained a retry count which has  }
{ been reached.  No further retries  }
{ should be attempted  }
{ New authentication token required.  }
  PAM_NEW_AUTHTOK_REQD = 12;  
{ This is normally returned if the  }
{ machine security policies require  }
{ that the password should be changed  }
{ because the password is NULL or it  }
{ has aged  }
{ User account has expired  }
  PAM_ACCT_EXPIRED = 13;  
{ Can not make/remove an entry for  }
  PAM_SESSION_ERR = 14;  
{ the specified session  }
{ Underlying authentication service  }
  PAM_CRED_UNAVAIL = 15;  
{ can not retrieve user credentials  }
{ unavailable  }
{ User credentials expired  }
  PAM_CRED_EXPIRED = 16;  
{ Failure setting user credentials  }
  PAM_CRED_ERR = 17;  
{ No module specific data is present  }
  PAM_NO_MODULE_DATA = 18;  
{ Conversation error  }
  PAM_CONV_ERR = 19;  
{ Authentication token manipulation error  }
  PAM_AUTHTOK_ERR = 20;  
{ Authentication information  }
  PAM_AUTHTOK_RECOVERY_ERR = 21;  
{ cannot be recovered  }
{ Authentication token lock busy  }
  PAM_AUTHTOK_LOCK_BUSY = 22;  
{ Authentication token aging disabled  }
  PAM_AUTHTOK_DISABLE_AGING = 23;  
{ Preliminary check by password service  }
  PAM_TRY_AGAIN = 24;  
{ Ignore underlying account module  }
  PAM_IGNORE = 25;  
{ regardless of whether the control  }
{ flag is required, optional, or sufficient  }
{ Critical error (?module fail now request)  }
  PAM_ABORT = 26;  
{ user's authentication token has expired  }
  PAM_AUTHTOK_EXPIRED = 27;  
{ module is not known  }
  PAM_MODULE_UNKNOWN = 28;  
{ Bad item passed to pam_*_item()  }
  PAM_BAD_ITEM = 29;  
{ conversation function is event driven
				     and data is not available yet  }
  PAM_CONV_AGAIN = 30;  
{ please call this function again to
				   complete authentication stack. Before
				   calling again, verify that conversation
				   is completed  }
  PAM_INCOMPLETE = 31;  
{
 * Add new #define's here - take care to also extend the libpam code:
 * pam_strerror() and "libpam/pam_tokens.h" .
  }
{ this is the number of return values  }
  _PAM_RETURN_VALUES = 32;  
{ ---------------------- The Linux-PAM flags --------------------  }
{ Authentication service should not generate any messages  }
  PAM_SILENT = $8000;  
{ Note: these flags are used by pam_authenticate,_secondary()  }
{ The authentication service should return PAM_AUTH_ERROR if the
 * user has a null authentication token  }
  PAM_DISALLOW_NULL_AUTHTOK = $0001;  
{ Note: these flags are used for pam_setcred()  }
{ Set user credentials for an authentication service  }
  PAM_ESTABLISH_CRED = $0002;  
{ Delete user credentials associated with an authentication service  }
  PAM_DELETE_CRED = $0004;  
{ Reinitialize user credentials  }
  PAM_REINITIALIZE_CRED = $0008;  
{ Extend lifetime of user credentials  }
  PAM_REFRESH_CRED = $0010;  
{ Note: these flags are used by pam_chauthtok  }
{ The password service should only update those passwords that have
 * aged.  If this flag is not passed, the password service should
 * update all passwords.  }
  PAM_CHANGE_EXPIRED_AUTHTOK = $0020;  
{ ------------------ The Linux-PAM item types -------------------  }
{ These defines are used by pam_set_item() and pam_get_item().
   Please check the spec which are allowed for use by applications
   and which are only allowed for use by modules.  }
{ The service name  }
  PAM_SERVICE = 1;  
{ The user name  }
  PAM_USER = 2;  
{ The tty name  }
  PAM_TTY = 3;  
{ The remote host name  }
  PAM_RHOST = 4;  
{ The pam_conv structure  }
  PAM_CONV = 5;  
{ The authentication token (password)  }
  PAM_AUTHTOK = 6;  
{ The old authentication token  }
  PAM_OLDAUTHTOK = 7;  
{ The remote user name  }
  PAM_RUSER = 8;  
{ the prompt for getting a username  }
  PAM_USER_PROMPT = 9;  
{ Linux-PAM extensions  }
{ app supplied function to override failure
				   delays  }
  PAM_FAIL_DELAY = 10;  
{ X display name  }
  PAM_XDISPLAY = 11;  
{ X server authentication data  }
  PAM_XAUTHDATA = 12;  
{ The type for pam_get_authtok  }
  PAM_AUTHTOK_TYPE = 13;  
{ -------------- Special defines used by Linux-PAM --------------  }
{$if defined(__GNUC__) && defined(__GNUC_MINOR__)}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PAM_GNUC_PREREQ(maj,min : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PAM_GNUC_PREREQ(maj,min : longint) : longint;

{$endif}
{ ---------- Common Linux-PAM application/module PI -----------  }
(* Const before type ignored *)

function pam_set_item(pamh:Ppam_handle_t; item_type:longint; item:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_get_item(pamh:Ppam_handle_t; item_type:longint; item:Ppointer):longint;cdecl;external;
(* Const before type ignored *)
function pam_strerror(pamh:Ppam_handle_t; errnum:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function pam_putenv(pamh:Ppam_handle_t; name_value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pam_getenv(pamh:Ppam_handle_t; name:Pchar):Pchar;cdecl;external;
function pam_getenvlist(pamh:Ppam_handle_t):^Pchar;cdecl;external;
{ ---------- Common Linux-PAM application/module PI -----------  }
{
 * here are some proposed error status definitions for the
 * 'error_status' argument used by the cleanup function associated
 * with data items they should be logically OR'd with the error_status
 * of the latest return from libpam -- new with .52 and positive
 * impression from Sun although not official as of 1996/9/4
 * [generally the other flags are to be found in pam_modules.h]
  }
{ used to suppress messages...  }
const
  PAM_DATA_SILENT = $40000000;  
{
 * here we define an externally (by apps or modules) callable function
 * that primes the libpam library to delay when a stacked set of
 * modules results in a failure. In the case of PAM_SUCCESS this delay
 * is ignored.
 *
 * Note, the pam_[gs]et_item(... PAM_FAIL_DELAY ...) can be used to set
 * a function pointer which can override the default fail-delay behavior.
 * This item was added to accommodate event driven programs that need to
 * manage delays more carefully.  The function prototype for this data
 * item is
 *     void (*fail_delay)(int status, unsigned int delay, void *appdata_ptr);
  }
{$define HAVE_PAM_FAIL_DELAY}

function pam_fail_delay(pamh:Ppam_handle_t; musec_delay:dword):longint;cdecl;external;
{ ------------ The Linux-PAM conversation structures ------------  }
{ Message styles  }
const
  PAM_PROMPT_ECHO_OFF = 1;  
  PAM_PROMPT_ECHO_ON = 2;  
  PAM_ERROR_MSG = 3;  
  PAM_TEXT_INFO = 4;  
{ Linux-PAM specific types  }
{ yes/no/maybe conditionals  }
  PAM_RADIO_TYPE = 5;  
{ This is for server client non-human interaction.. these are NOT
   part of the X/Open PAM specification.  }
  PAM_BINARY_PROMPT = 7;  
{ maximum size of messages/responses etc.. (these are mostly
   arbitrary so Linux-PAM should handle longer values).  }
  PAM_MAX_NUM_MSG = 32;  
  PAM_MAX_MSG_SIZE = 512;  
  PAM_MAX_RESP_SIZE = 512;  
{ Used to pass prompting text, error messages, or other informatory
 * text to the user.  This structure is allocated and freed by the PAM
 * library (or loaded module).   }
(* Const before type ignored *)
type
  Ppam_message = ^Tpam_message;
  Tpam_message = record
      msg_style : longint;
      msg : Pchar;
    end;

{ if the pam_message.msg_style = PAM_BINARY_PROMPT
   the 'pam_message.msg' is a pointer to a 'const *' for the following
   pseudo-structure.  When used with a PAM_BINARY_PROMPT, the returned
   pam_response.resp pointer points to an object with the following
   structure:

   struct 
       u32 length;                         #  network byte order
       unsigned char type;
       unsigned char data[length-5];
   ;

   The 'libpamc' library is designed around this flavor of
   message and should be used to handle this flavor of msg_style.
    }
{ Used to return the user's response to the PAM library.  This
   structure is allocated by the application program, and free()'d by
   the Linux-PAM library (or calling module).   }
{ currently un-used, zero expected  }
  Ppam_response = ^Tpam_response;
  Tpam_response = record
      resp : Pchar;
      resp_retcode : longint;
    end;

{ The actual conversation structure itself  }
(* Const before type ignored *)
  Ppam_conv = ^Tpam_conv;
  Tpam_conv = record
      conv : function (num_msg:longint; msg:PPpam_message; resp:PPpam_response; appdata_ptr:pointer):longint;cdecl;
      appdata_ptr : pointer;
    end;

{ Used by the PAM_XAUTHDATA pam item.  Contains X authentication
   data used by modules to connect to the user's X display.  Note:
   this structure is intentionally compatible with xcb_auth_info_t.  }
  Ppam_xauth_data = ^Tpam_xauth_data;
  Tpam_xauth_data = record
      namelen : longint;
      name : Pchar;
      datalen : longint;
      data : Pchar;
    end;

{ ... adapted from the pam_appl.h file created by Theodore Ts'o and
 *
 * Copyright Theodore Ts'o, 1996.  All rights reserved.
 * Copyright (c) Andrew G. Morgan <morgan@linux.kernel.org>, 1996-8
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
 * OF THE POSSIBILITY OF SUCH DAMAGE.   }
{$endif}
{ _SECURITY__PAM_TYPES_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PAM_GNUC_PREREQ(maj,min : longint) : longint;
begin
  PAM_GNUC_PREREQ:=((__GNUC__ shl 16)+__GNUC_MINOR__)>=((maj shl 16)+min);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PAM_GNUC_PREREQ(maj,min : longint) : longint;
begin
  PAM_GNUC_PREREQ:=0;
end;


end.
