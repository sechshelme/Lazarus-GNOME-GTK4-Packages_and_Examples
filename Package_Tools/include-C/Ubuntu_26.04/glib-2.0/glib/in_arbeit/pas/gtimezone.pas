unit gtimezone;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2010 Codethink Limited
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Ryan Lortie <desrt@desrt.ca>
  }
{$ifndef __G_TIME_ZONE_H__}
{$define __G_TIME_ZONE_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{$include <glib/gtypes.h>}
type
{*
 * GTimeType:
 * @G_TIME_TYPE_STANDARD: the time is in local standard time
 * @G_TIME_TYPE_DAYLIGHT: the time is in local daylight time
 * @G_TIME_TYPE_UNIVERSAL: the time is in UTC
 *
 * Disambiguates a given time in two ways.
 *
 * First, specifies if the given time is in universal or local time.
 *
 * Second, if the time is in local time, specifies if it is local
 * standard time or local daylight time.  This is important for the case
 * where the same local time occurs twice (during daylight savings time
 * transitions, for example).
  }

  PGTimeType = ^TGTimeType;
  TGTimeType =  Longint;
  Const
    G_TIME_TYPE_STANDARD = 0;
    G_TIME_TYPE_DAYLIGHT = 1;
    G_TIME_TYPE_UNIVERSAL = 2;
;
{xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxextern //xxxxxGLIB_DEPRECATED_IN_2_68_FOR (g_time_zone_new_identifier) }

function g_time_zone_new(identifier:Pgchar):PGTimeZone;cdecl;external libglib2;
function g_time_zone_new_identifier(identifier:Pgchar):PGTimeZone;cdecl;external libglib2;
function g_time_zone_new_utc:PGTimeZone;cdecl;external libglib2;
function g_time_zone_new_local:PGTimeZone;cdecl;external libglib2;
function g_time_zone_new_offset(seconds:Tgint32):PGTimeZone;cdecl;external libglib2;
function g_time_zone_ref(tz:PGTimeZone):PGTimeZone;cdecl;external libglib2;
procedure g_time_zone_unref(tz:PGTimeZone);cdecl;external libglib2;
function g_time_zone_find_interval(tz:PGTimeZone; _type:TGTimeType; time_:Tgint64):Tgint;cdecl;external libglib2;
function g_time_zone_adjust_time(tz:PGTimeZone; _type:TGTimeType; time_:Pgint64):Tgint;cdecl;external libglib2;
function g_time_zone_get_abbreviation(tz:PGTimeZone; interval:Tgint):Pgchar;cdecl;external libglib2;
function g_time_zone_get_offset(tz:PGTimeZone; interval:Tgint):Tgint32;cdecl;external libglib2;
function g_time_zone_is_dst(tz:PGTimeZone; interval:Tgint):Tgboolean;cdecl;external libglib2;
function g_time_zone_get_identifier(tz:PGTimeZone):Pgchar;cdecl;external libglib2;
{$endif}
{ __G_TIME_ZONE_H__  }

// === Konventiert am: 22-6-26 19:40:29 ===


implementation



end.
