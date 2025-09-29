unit soup_date_utils;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Igalia, S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
type
  PSoupDateFormat = ^TSoupDateFormat;
  TSoupDateFormat =  Longint;
  Const
    SOUP_DATE_HTTP = 1;
    SOUP_DATE_COOKIE = 2;
;

function soup_date_time_to_string(date:PGDateTime; format:TSoupDateFormat):Pchar;cdecl;external libsoup;
function soup_date_time_new_from_http_string(date_string:Pchar):PGDateTime;cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:44:59 ===


implementation



end.
