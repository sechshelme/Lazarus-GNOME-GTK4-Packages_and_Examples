
unit WebKitMemoryPressureSettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitMemoryPressureSettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitMemoryPressureSettings.h
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
PWebKitMemoryPressureSettings  = ^WebKitMemoryPressureSettings;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Igalia S.L.
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
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitMemoryPressureSettings_h}
{$define WebKitMemoryPressureSettings_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_MEMORY_PRESSURE_SETTINGS : longint; { return type might be wrong }

type

function webkit_memory_pressure_settings_get_type:TGType;cdecl;external;
function webkit_memory_pressure_settings_new:PWebKitMemoryPressureSettings;cdecl;external;
function webkit_memory_pressure_settings_copy(settings:PWebKitMemoryPressureSettings):PWebKitMemoryPressureSettings;cdecl;external;
procedure webkit_memory_pressure_settings_free(settings:PWebKitMemoryPressureSettings);cdecl;external;
procedure webkit_memory_pressure_settings_set_memory_limit(settings:PWebKitMemoryPressureSettings; memory_limit:Tguint);cdecl;external;
function webkit_memory_pressure_settings_get_memory_limit(settings:PWebKitMemoryPressureSettings):Tguint;cdecl;external;
procedure webkit_memory_pressure_settings_set_conservative_threshold(settings:PWebKitMemoryPressureSettings; value:Tgdouble);cdecl;external;
function webkit_memory_pressure_settings_get_conservative_threshold(settings:PWebKitMemoryPressureSettings):Tgdouble;cdecl;external;
procedure webkit_memory_pressure_settings_set_strict_threshold(settings:PWebKitMemoryPressureSettings; value:Tgdouble);cdecl;external;
function webkit_memory_pressure_settings_get_strict_threshold(settings:PWebKitMemoryPressureSettings):Tgdouble;cdecl;external;
procedure webkit_memory_pressure_settings_set_kill_threshold(settings:PWebKitMemoryPressureSettings; value:Tgdouble);cdecl;external;
function webkit_memory_pressure_settings_get_kill_threshold(settings:PWebKitMemoryPressureSettings):Tgdouble;cdecl;external;
procedure webkit_memory_pressure_settings_set_poll_interval(settings:PWebKitMemoryPressureSettings; value:Tgdouble);cdecl;external;
function webkit_memory_pressure_settings_get_poll_interval(settings:PWebKitMemoryPressureSettings):Tgdouble;cdecl;external;
{$endif}
{ WebKitMemoryPressureSettings_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_MEMORY_PRESSURE_SETTINGS : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_MEMORY_PRESSURE_SETTINGS:=webkit_memory_pressure_settings_get_type;
  end;


end.
