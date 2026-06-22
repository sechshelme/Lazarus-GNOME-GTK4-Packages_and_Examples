unit grand;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_RAND_H__}
{$define __G_RAND_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type
{ GRand - a good and fast random number generator: Mersenne Twister
 * see http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html for more info.
 * The range functions return a value in the interval [begin, end).
 * int          -> [0..2^32-1]
 * int_range    -> [begin..end-1]
 * double       -> [0..1)
 * double_range -> [begin..end)
  }

function g_rand_new_with_seed(seed:Tguint32):PGRand;cdecl;external libglib2;
function g_rand_new_with_seed_array(seed:Pguint32; seed_length:Tguint):PGRand;cdecl;external libglib2;
function g_rand_new:PGRand;cdecl;external libglib2;
procedure g_rand_free(rand_:PGRand);cdecl;external libglib2;
function g_rand_copy(rand_:PGRand):PGRand;cdecl;external libglib2;
procedure g_rand_set_seed(rand_:PGRand; seed:Tguint32);cdecl;external libglib2;
procedure g_rand_set_seed_array(rand_:PGRand; seed:Pguint32; seed_length:Tguint);cdecl;external libglib2;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_rand_boolean(rand_ : longint) : longint;

function g_rand_int(rand_:PGRand):Tguint32;cdecl;external libglib2;
function g_rand_int_range(rand_:PGRand; begin:Tgint32; end:Tgint32):Tgint32;cdecl;external libglib2;
function g_rand_double(rand_:PGRand):Tgdouble;cdecl;external libglib2;
function g_rand_double_range(rand_:PGRand; begin:Tgdouble; end:Tgdouble):Tgdouble;cdecl;external libglib2;
procedure g_random_set_seed(seed:Tguint32);cdecl;external libglib2;
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_random_boolean : longint;

function g_random_int:Tguint32;cdecl;external libglib2;
function g_random_int_range(begin:Tgint32; end:Tgint32):Tgint32;cdecl;external libglib2;
function g_random_double:Tgdouble;cdecl;external libglib2;
function g_random_double_range(begin:Tgdouble; end:Tgdouble):Tgdouble;cdecl;external libglib2;
{$endif}
{ __G_RAND_H__  }

// === Konventiert am: 22-6-26 17:17:05 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_rand_boolean(rand_ : longint) : longint;
begin
  g_rand_boolean:=((g_rand_int(rand_)) and (1 shl 15))<>0;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function g_random_boolean : longint;
begin
  g_random_boolean:=((g_random_int) and (1 shl 15))<>0;
end;


end.
