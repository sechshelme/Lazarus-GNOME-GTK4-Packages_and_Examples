
unit lsmdebug;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdebug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdebug.h
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
PLsmDebugCategory  = ^LsmDebugCategory;
PLsmDebugLevel  = ^LsmDebugLevel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2010-2012 Emmanuel Pacaud
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
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_DEBUG_H}
{$define LSM_DEBUG_H}
{$include <glib.h>}
type
  PLsmDebugLevel = ^TLsmDebugLevel;
  TLsmDebugLevel =  Longint;
  Const
    LSM_DEBUG_LEVEL_NONE = 0;
    LSM_DEBUG_LEVEL_WARNING = 1;
    LSM_DEBUG_LEVEL_DEBUG = 2;
    LSM_DEBUG_LEVEL_LOG = 3;
    LSM_DEBUG_LEVEL_COUNT = 4;
;
type
  var
    lsm_debug_category_dom : TLsmDebugCategory;cvar;external;
    lsm_debug_category_measure : TLsmDebugCategory;cvar;external;
    lsm_debug_category_update : TLsmDebugCategory;cvar;external;
    lsm_debug_category_render : TLsmDebugCategory;cvar;external;
    lsm_debug_category_viewport : TLsmDebugCategory;cvar;external;
(* Const before type ignored *)

procedure lsm_warning(category:PLsmDebugCategory; format:Pchar; args:array of const);cdecl;external;
procedure lsm_warning(category:PLsmDebugCategory; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure lsm_debug(category:PLsmDebugCategory; format:Pchar; args:array of const);cdecl;external;
procedure lsm_debug(category:PLsmDebugCategory; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure lsm_log(category:PLsmDebugCategory; format:Pchar; args:array of const);cdecl;external;
procedure lsm_log(category:PLsmDebugCategory; format:Pchar);cdecl;external;
function lsm_debug_check(category:PLsmDebugCategory; level:TLsmDebugLevel):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure lsm_debug_enable(category_selection:Pchar);cdecl;external;
{$endif}

implementation


end.
