unit guri;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright © 2020 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see
 * <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type

function g_uri_ref(uri:PGUri):PGUri;cdecl;external libglib2;
procedure g_uri_unref(uri:PGUri);cdecl;external libglib2;
{*
 * GUriFlags:
 * @G_URI_FLAGS_NONE: No flags set.
 * @G_URI_FLAGS_PARSE_RELAXED: Parse the URI more relaxedly than the
 *     [RFC 3986](https://tools.ietf.org/html/rfc3986) grammar specifies,
 *     fixing up or ignoring common mistakes in URIs coming from external
 *     sources. This is also needed for some obscure URI schemes where `;`
 *     separates the host from the path. Don’t use this flag unless you need to.
 * @G_URI_FLAGS_HAS_PASSWORD: The userinfo field may contain a password,
 *     which will be separated from the username by `:`.
 * @G_URI_FLAGS_HAS_AUTH_PARAMS: The userinfo may contain additional
 *     authentication-related parameters, which will be separated from
 *     the username and/or password by `;`.
 * @G_URI_FLAGS_NON_DNS: The host component should not be assumed to be a
 *     DNS hostname or IP address (for example, for `smb` URIs with NetBIOS
 *     hostnames).
 * @G_URI_FLAGS_ENCODED: When parsing a URI, this indicates that `%`-encoded
 *     characters in the userinfo, path, query, and fragment fields
 *     should not be decoded. (And likewise the host field if
 *     %G_URI_FLAGS_NON_DNS is also set.) When building a URI, it indicates
 *     that you have already `%`-encoded the components, and so #GUri
 *     should not do any encoding itself.
 * @G_URI_FLAGS_ENCODED_QUERY: Same as %G_URI_FLAGS_ENCODED, for the query
 *     field only.
 * @G_URI_FLAGS_ENCODED_PATH: Same as %G_URI_FLAGS_ENCODED, for the path only.
 * @G_URI_FLAGS_ENCODED_FRAGMENT: Same as %G_URI_FLAGS_ENCODED, for the
 *     fragment only.
 * @G_URI_FLAGS_SCHEME_NORMALIZE: A scheme-based normalization will be applied.
 *     For example, when parsing an HTTP URI changing omitted path to `/` and
 *     omitted port to `80`; and when building a URI, changing empty path to `/`
 *     and default port `80`). This only supports a subset of known schemes. (Since: 2.68)
 *
 * Flags that describe a URI.
 *
 * When parsing a URI, if you need to choose different flags based on
 * the type of URI, you can use g_uri_peek_scheme() on the URI string
 * to check the scheme first, and use that to decide what flags to
 * parse it with.
 *
 * Since: 2.66
  }
type
  PGUriFlags = ^TGUriFlags;
  TGUriFlags =  Longint;
  Const
    G_URI_FLAGS_NONE = 0;
    G_URI_FLAGS_PARSE_RELAXED = 1 shl 0;
    G_URI_FLAGS_HAS_PASSWORD = 1 shl 1;
    G_URI_FLAGS_HAS_AUTH_PARAMS = 1 shl 2;
    G_URI_FLAGS_ENCODED = 1 shl 3;
    G_URI_FLAGS_NON_DNS = 1 shl 4;
    G_URI_FLAGS_ENCODED_QUERY = 1 shl 5;
    G_URI_FLAGS_ENCODED_PATH = 1 shl 6;
    G_URI_FLAGS_ENCODED_FRAGMENT = 1 shl 7;
    G_URI_FLAGS_SCHEME_NORMALIZE = 1 shl 8;
;

function g_uri_split(uri_ref:Pgchar; flags:TGUriFlags; scheme:PPgchar; userinfo:PPgchar; host:PPgchar; 
           port:Pgint; path:PPgchar; query:PPgchar; fragment:PPgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_uri_split_with_user(uri_ref:Pgchar; flags:TGUriFlags; scheme:PPgchar; user:PPgchar; password:PPgchar; 
           auth_params:PPgchar; host:PPgchar; port:Pgint; path:PPgchar; query:PPgchar; 
           fragment:PPgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_uri_split_network(uri_string:Pgchar; flags:TGUriFlags; scheme:PPgchar; host:PPgchar; port:Pgint; 
           error:PPGError):Tgboolean;cdecl;external libglib2;
function g_uri_is_valid(uri_string:Pgchar; flags:TGUriFlags; error:PPGError):Tgboolean;cdecl;external libglib2;
function g_uri_join(flags:TGUriFlags; scheme:Pgchar; userinfo:Pgchar; host:Pgchar; port:Tgint; 
           path:Pgchar; query:Pgchar; fragment:Pgchar):Pgchar;cdecl;external libglib2;
function g_uri_join_with_user(flags:TGUriFlags; scheme:Pgchar; user:Pgchar; password:Pgchar; auth_params:Pgchar; 
           host:Pgchar; port:Tgint; path:Pgchar; query:Pgchar; fragment:Pgchar):Pgchar;cdecl;external libglib2;
function g_uri_parse(uri_string:Pgchar; flags:TGUriFlags; error:PPGError):PGUri;cdecl;external libglib2;
function g_uri_parse_relative(base_uri:PGUri; uri_ref:Pgchar; flags:TGUriFlags; error:PPGError):PGUri;cdecl;external libglib2;
function g_uri_resolve_relative(base_uri_string:Pgchar; uri_ref:Pgchar; flags:TGUriFlags; error:PPGError):Pgchar;cdecl;external libglib2;
function g_uri_build(flags:TGUriFlags; scheme:Pgchar; userinfo:Pgchar; host:Pgchar; port:Tgint; 
           path:Pgchar; query:Pgchar; fragment:Pgchar):PGUri;cdecl;external libglib2;
function g_uri_build_with_user(flags:TGUriFlags; scheme:Pgchar; user:Pgchar; password:Pgchar; auth_params:Pgchar; 
           host:Pgchar; port:Tgint; path:Pgchar; query:Pgchar; fragment:Pgchar):PGUri;cdecl;external libglib2;
{*
 * GUriHideFlags:
 * @G_URI_HIDE_NONE: No flags set.
 * @G_URI_HIDE_USERINFO: Hide the userinfo.
 * @G_URI_HIDE_PASSWORD: Hide the password.
 * @G_URI_HIDE_AUTH_PARAMS: Hide the auth_params.
 * @G_URI_HIDE_QUERY: Hide the query.
 * @G_URI_HIDE_FRAGMENT: Hide the fragment.
 *
 * Flags describing what parts of the URI to hide in
 * g_uri_to_string_partial(). Note that %G_URI_HIDE_PASSWORD and
 * %G_URI_HIDE_AUTH_PARAMS will only work if the #GUri was parsed with
 * the corresponding flags.
 *
 * Since: 2.66
  }
type
  PGUriHideFlags = ^TGUriHideFlags;
  TGUriHideFlags =  Longint;
  Const
    G_URI_HIDE_NONE = 0;
    G_URI_HIDE_USERINFO = 1 shl 0;
    G_URI_HIDE_PASSWORD = 1 shl 1;
    G_URI_HIDE_AUTH_PARAMS = 1 shl 2;
    G_URI_HIDE_QUERY = 1 shl 3;
    G_URI_HIDE_FRAGMENT = 1 shl 4;
;

function g_uri_to_string(uri:PGUri):Pchar;cdecl;external libglib2;
function g_uri_to_string_partial(uri:PGUri; flags:TGUriHideFlags):Pchar;cdecl;external libglib2;
function g_uri_get_scheme(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_userinfo(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_user(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_password(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_auth_params(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_host(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_port(uri:PGUri):Tgint;cdecl;external libglib2;
function g_uri_get_path(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_query(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_fragment(uri:PGUri):Pgchar;cdecl;external libglib2;
function g_uri_get_flags(uri:PGUri):TGUriFlags;cdecl;external libglib2;
{*
 * GUriParamsFlags:
 * @G_URI_PARAMS_NONE: No flags set.
 * @G_URI_PARAMS_CASE_INSENSITIVE: Parameter names are case insensitive.
 * @G_URI_PARAMS_WWW_FORM: Replace `+` with space character. Only useful for
 *     URLs on the web, using the `https` or `http` schemas.
 * @G_URI_PARAMS_PARSE_RELAXED: See %G_URI_FLAGS_PARSE_RELAXED.
 *
 * Flags modifying the way parameters are handled by g_uri_parse_params() and
 * #GUriParamsIter.
 *
 * Since: 2.66
  }
type
  PGUriParamsFlags = ^TGUriParamsFlags;
  TGUriParamsFlags =  Longint;
  Const
    G_URI_PARAMS_NONE = 0;
    G_URI_PARAMS_CASE_INSENSITIVE = 1 shl 0;
    G_URI_PARAMS_WWW_FORM = 1 shl 1;
    G_URI_PARAMS_PARSE_RELAXED = 1 shl 2;
;

function g_uri_parse_params(params:Pgchar; length:Tgssize; separators:Pgchar; flags:TGUriParamsFlags; error:PPGError):PGHashTable;cdecl;external libglib2;
type
{< private > }
  PGUriParamsIter = ^TGUriParamsIter;
  TGUriParamsIter = record
      dummy0 : Tgint;
      dummy1 : Tgpointer;
      dummy2 : Tgpointer;
      dummy3 : array[0..255] of Tguint8;
    end;


procedure g_uri_params_iter_init(iter:PGUriParamsIter; params:Pgchar; length:Tgssize; separators:Pgchar; flags:TGUriParamsFlags);cdecl;external libglib2;
function g_uri_params_iter_next(iter:PGUriParamsIter; attribute:PPgchar; value:PPgchar; error:PPGError):Tgboolean;cdecl;external libglib2;
{*
 * G_URI_ERROR:
 *
 * Error domain for URI methods. Errors in this domain will be from
 * the #GUriError enumeration. See #GError for information on error
 * domains.
 *
 * Since: 2.66
  }
{ was #define dname def_expr }
function G_URI_ERROR : longint; { return type might be wrong }

function g_uri_error_quark:TGQuark;cdecl;external libglib2;
{*
 * GUriError:
 * @G_URI_ERROR_FAILED: Generic error if no more specific error is available.
 *     See the error message for details.
 * @G_URI_ERROR_BAD_SCHEME: The scheme of a URI could not be parsed.
 * @G_URI_ERROR_BAD_USER: The user/userinfo of a URI could not be parsed.
 * @G_URI_ERROR_BAD_PASSWORD: The password of a URI could not be parsed.
 * @G_URI_ERROR_BAD_AUTH_PARAMS: The authentication parameters of a URI could not be parsed.
 * @G_URI_ERROR_BAD_HOST: The host of a URI could not be parsed.
 * @G_URI_ERROR_BAD_PORT: The port of a URI could not be parsed.
 * @G_URI_ERROR_BAD_PATH: The path of a URI could not be parsed.
 * @G_URI_ERROR_BAD_QUERY: The query of a URI could not be parsed.
 * @G_URI_ERROR_BAD_FRAGMENT: The fragment of a URI could not be parsed.
 *
 * Error codes returned by #GUri methods.
 *
 * Since: 2.66
  }
type
  PGUriError = ^TGUriError;
  TGUriError =  Longint;
  Const
    G_URI_ERROR_FAILED = 0;
    G_URI_ERROR_BAD_SCHEME = 1;
    G_URI_ERROR_BAD_USER = 2;
    G_URI_ERROR_BAD_PASSWORD = 3;
    G_URI_ERROR_BAD_AUTH_PARAMS = 4;
    G_URI_ERROR_BAD_HOST = 5;
    G_URI_ERROR_BAD_PORT = 6;
    G_URI_ERROR_BAD_PATH = 7;
    G_URI_ERROR_BAD_QUERY = 8;
    G_URI_ERROR_BAD_FRAGMENT = 9;
;
{*
 * G_URI_RESERVED_CHARS_GENERIC_DELIMITERS:
 *
 * Generic delimiters characters as defined in
 * [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `:/?#[]@`.
 *
 * Since: 2.16
 * }
  G_URI_RESERVED_CHARS_GENERIC_DELIMITERS = ':/?#[]@';  
{*
 * G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS:
 *
 * Subcomponent delimiter characters as defined in
 * [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `!$&'()*+,;=`.
 *
 * Since: 2.16
 * }
  G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = '!$&'()*+,;=';  
{*
 * G_URI_RESERVED_CHARS_ALLOWED_IN_PATH_ELEMENT:
 *
 * Allowed characters in path elements. Includes `!$&'()*+,;=:@`.
 *
 * Since: 2.16
 * }
{xxxxxxxx#define G_URI_RESERVED_CHARS_ALLOWED_IN_PATH_ELEMENT G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS ":@" }
{*
 * G_URI_RESERVED_CHARS_ALLOWED_IN_PATH:
 *
 * Allowed characters in a path. Includes `!$&'()*+,;=:@/`.
 *
 * Since: 2.16
 * }
{xxxxxxxxx#define G_URI_RESERVED_CHARS_ALLOWED_IN_PATH G_URI_RESERVED_CHARS_ALLOWED_IN_PATH_ELEMENT "/" }
{*
 * G_URI_RESERVED_CHARS_ALLOWED_IN_USERINFO:
 *
 * Allowed characters in userinfo as defined in
 * [RFC 3986](https://tools.ietf.org/html/rfc3986). Includes `!$&'()*+,;=:`.
 *
 * Since: 2.16
 * }
{xxxxxxxx#define G_URI_RESERVED_CHARS_ALLOWED_IN_USERINFO G_URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS ":" }

function g_uri_unescape_string(escaped_string:Pchar; illegal_characters:Pchar):Pchar;cdecl;external libglib2;
function g_uri_unescape_segment(escaped_string:Pchar; escaped_string_end:Pchar; illegal_characters:Pchar):Pchar;cdecl;external libglib2;
function g_uri_parse_scheme(uri:Pchar):Pchar;cdecl;external libglib2;
function g_uri_peek_scheme(uri:Pchar):Pchar;cdecl;external libglib2;
function g_uri_escape_string(unescaped:Pchar; reserved_chars_allowed:Pchar; allow_utf8:Tgboolean):Pchar;cdecl;external libglib2;
function g_uri_unescape_bytes(escaped_string:Pchar; length:Tgssize; illegal_characters:Pchar; error:PPGError):PGBytes;cdecl;external libglib2;
function g_uri_escape_bytes(unescaped:Pguint8; length:Tgsize; reserved_chars_allowed:Pchar):Pchar;cdecl;external libglib2;

// === Konventiert am: 22-6-26 20:02:54 ===


implementation


{ was #define dname def_expr }
function G_URI_ERROR : longint; { return type might be wrong }
  begin
    G_URI_ERROR:=g_uri_error_quark;
  end;


end.
