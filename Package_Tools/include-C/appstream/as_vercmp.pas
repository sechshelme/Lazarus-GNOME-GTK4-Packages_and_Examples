unit as_vercmp;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "as-component.h"}
{*
 * AsVercmpFlags:
 * @AS_VERCMP_FLAG_NONE:		No flags set
 * @AS_VERCMP_FLAG_IGNORE_EPOCH:	Ignore epoch part of a version string.
 *
 * The flags used when matching unique IDs.
 * }
{< private > }
type
  PAsVercmpFlags = ^TAsVercmpFlags;
  TAsVercmpFlags =  Longint;
  Const
    AS_VERCMP_FLAG_NONE = 0;
    AS_VERCMP_FLAG_IGNORE_EPOCH = 1 shl 0;
    AS_VERCMP_FLAG_LAST = (1 shl 0)+1;
;

function as_vercmp(a:Pgchar; b:Pgchar; flags:TAsVercmpFlags):Tgint;cdecl;external libappstream;
function as_vercmp_simple(a:Pgchar; b:Pgchar):Tgint;cdecl;external libappstream;
function as_vercmp_test_match(ver1:Pgchar; compare:TAsRelationCompare; ver2:Pgchar; flags:TAsVercmpFlags):Tgboolean;cdecl;external libappstream;

// === Konventiert am: 30-7-26 19:34:14 ===


implementation



end.
