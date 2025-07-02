unit legacy;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of the SSH Library
 *
 * Copyright (c) 2010 by Aris Adamantiadis
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{ Since libssh.h includes legacy.h, it's important that libssh.h is included
 * first. we don't define LEGACY_H now because we want it to be defined when
 * included from libssh.h
 * All function calls declared in this header are deprecated and meant to be
 * removed in future.
  }
{$ifndef LEGACY_H_}
{$define LEGACY_H_}
type
  Pssh_private_key = ^Tssh_private_key;
  Tssh_private_key = Pssh_private_key_struct;

  Pssh_public_key = ^Tssh_public_key;
  Tssh_public_key = Pssh_public_key_struct;
{ C++ extern C conditionnal removed }

function ssh_auth_list(session:Tssh_session):longint;cdecl;external libssh;
function ssh_userauth_offer_pubkey(session:Tssh_session; username:Pchar; _type:longint; publickey:Tssh_string):longint;cdecl;external libssh;
function ssh_userauth_pubkey(session:Tssh_session; username:Pchar; publickey:Tssh_string; privatekey:Tssh_private_key):longint;cdecl;external libssh;
{$ifndef _WIN32}

function ssh_userauth_agent_pubkey(session:Tssh_session; username:Pchar; publickey:Tssh_public_key):longint;cdecl;external libssh;
{$endif}

function ssh_userauth_autopubkey(session:Tssh_session; passphrase:Pchar):longint;cdecl;external libssh;
function ssh_userauth_privatekey_file(session:Tssh_session; username:Pchar; filename:Pchar; passphrase:Pchar):longint;cdecl;external libssh;
{SSH_DEPRECATED }procedure buffer_free(buffer:Tssh_buffer);cdecl;external libssh;
{SSH_DEPRECATED }function buffer_get(buffer:Tssh_buffer):pointer;cdecl;external libssh;
{SSH_DEPRECATED }function buffer_get_len(buffer:Tssh_buffer):Tuint32_t;cdecl;external libssh;
{SSH_DEPRECATED }function buffer_new:Tssh_buffer;cdecl;external libssh;
{SSH_DEPRECATED }function channel_accept_x11(channel:Tssh_channel; timeout_ms:longint):Tssh_channel;cdecl;external libssh;
{SSH_DEPRECATED }function channel_change_pty_size(channel:Tssh_channel; cols:longint; rows:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_forward_accept(session:Tssh_session; timeout_ms:longint):Tssh_channel;cdecl;external libssh;
{SSH_DEPRECATED }function channel_close(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_forward_cancel(session:Tssh_session; address:Pchar; port:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_forward_listen(session:Tssh_session; address:Pchar; port:longint; bound_port:Plongint):longint;cdecl;external libssh;
{SSH_DEPRECATED }procedure channel_free(channel:Tssh_channel);cdecl;external libssh;
{SSH_DEPRECATED }function channel_get_exit_status(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_get_session(channel:Tssh_channel):Tssh_session;cdecl;external libssh;
{SSH_DEPRECATED }function channel_is_closed(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_is_eof(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_is_open(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_new(session:Tssh_session):Tssh_channel;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_open_forward(channel:Tssh_channel; remotehost:Pchar; remoteport:longint; sourcehost:Pchar; localport:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_open_session(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_poll(channel:Tssh_channel; is_stderr:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_read(channel:Tssh_channel; dest:pointer; count:Tuint32_t; is_stderr:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_read_buffer(channel:Tssh_channel; buffer:Tssh_buffer; count:Tuint32_t; is_stderr:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_read_nonblocking(channel:Tssh_channel; dest:pointer; count:Tuint32_t; is_stderr:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_request_env(channel:Tssh_channel; name:Pchar; value:Pchar):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_request_exec(channel:Tssh_channel; cmd:Pchar):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_request_pty(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_request_pty_size(channel:Tssh_channel; term:Pchar; cols:longint; rows:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_request_shell(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_request_send_signal(channel:Tssh_channel; signum:Pchar):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_request_sftp(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_request_subsystem(channel:Tssh_channel; subsystem:Pchar):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_request_x11(channel:Tssh_channel; single_connection:longint; protocol:Pchar; cookie:Pchar; screen_number:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_send_eof(channel:Tssh_channel):longint;cdecl;external libssh;
{SSH_DEPRECATED }function channel_select(readchans:Pssh_channel; writechans:Pssh_channel; exceptchans:Pssh_channel; timeout:Ptimeval):longint;cdecl;external libssh;
{SSH_DEPRECATED }procedure channel_set_blocking(channel:Tssh_channel; blocking:longint);cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_write(channel:Tssh_channel; data:pointer; len:Tuint32_t):longint;cdecl;external libssh;
{SSH_DEPRECATED }procedure privatekey_free(prv:Tssh_private_key);cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function privatekey_from_file(session:Tssh_session; filename:Pchar; _type:longint; passphrase:Pchar):Tssh_private_key;cdecl;external libssh;
{SSH_DEPRECATED }procedure publickey_free(key:Tssh_public_key);cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_publickey_to_file(session:Tssh_session; file:Pchar; pubkey:Tssh_string; _type:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function publickey_from_file(session:Tssh_session; filename:Pchar; _type:Plongint):Tssh_string;cdecl;external libssh;
{SSH_DEPRECATED }function publickey_from_privatekey(prv:Tssh_private_key):Tssh_public_key;cdecl;external libssh;
{SSH_DEPRECATED }function publickey_to_string(key:Tssh_public_key):Tssh_string;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_try_publickey_from_file(session:Tssh_session; keyfile:Pchar; publickey:Pssh_string; _type:Plongint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_privatekey_type(privatekey:Tssh_private_key):Tssh_keytypes_e;cdecl;external libssh;
function ssh_get_pubkey(session:Tssh_session):Tssh_string;cdecl;external libssh;
function ssh_message_retrieve(session:Tssh_session; packettype:Tuint32_t):Tssh_message;cdecl;external libssh;
function ssh_message_auth_publickey(msg:Tssh_message):Tssh_public_key;cdecl;external libssh;
{SSH_DEPRECATED }procedure string_burn(str:Tssh_string);cdecl;external libssh;
{SSH_DEPRECATED }function string_copy(str:Tssh_string):Tssh_string;cdecl;external libssh;
{SSH_DEPRECATED }function string_data(str:Tssh_string):pointer;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function string_fill(str:Tssh_string; data:pointer; len:Tsize_t):longint;cdecl;external libssh;
{SSH_DEPRECATED }procedure string_free(str:Tssh_string);cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function string_from_char(what:Pchar):Tssh_string;cdecl;external libssh;
{SSH_DEPRECATED }function string_len(str:Tssh_string):Tsize_t;cdecl;external libssh;
{SSH_DEPRECATED }function string_new(size:Tsize_t):Tssh_string;cdecl;external libssh;
{SSH_DEPRECATED }function string_to_char(str:Tssh_string):Pchar;cdecl;external libssh;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LEGACY_H_  }

// === Konventiert am: 2-7-25 17:32:18 ===


implementation



end.
