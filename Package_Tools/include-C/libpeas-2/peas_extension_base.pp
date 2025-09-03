
unit peas_extension_base;
interface

{
  Automatically converted by H2Pas 1.0.0 from peas_extension_base.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peas_extension_base.h
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
PPeasExtensionBase  = ^PeasExtensionBase;
PPeasExtensionBaseClass  = ^PeasExtensionBaseClass;
PPeasPluginInfo  = ^PeasPluginInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * peas-extension-base.h
 * This file is part of libpeas
 *
 * Copyright (C) 2002-2005 - Paolo Maggi
 *
 * libpeas is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libpeas is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (LIBPEAS_INSIDE) && !defined (LIBPEAS_COMPILATION)}
{$error "Only <libpeas.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include "peas-plugin-info.h"}
{$include "peas-version-macros.h"}

{ was #define dname def_expr }
function PEAS_TYPE_EXTENSION_BASE : longint; { return type might be wrong }

{ G_DECLARE_DERIVABLE_TYPE (PeasExtensionBase, peas_extension_base, PEAS, EXTENSION_BASE, GObject) }
{*
 * PeasExtensionBaseClass:
 * @parent_class: The parent class.
 *
 * The class structure of #PeasExtensionBase.
  }
{< private > }
type
  PPeasExtensionBaseClass = ^TPeasExtensionBaseClass;
  TPeasExtensionBaseClass = record
      parent_class : TGObjectClass;
      _reserved : array[0..7] of Tgpointer;
    end;


function peas_extension_base_get_plugin_info(extbase:PPeasExtensionBase):PPeasPluginInfo;cdecl;external;
function peas_extension_base_get_data_dir(extbase:PPeasExtensionBase):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function PEAS_TYPE_EXTENSION_BASE : longint; { return type might be wrong }
  begin
    PEAS_TYPE_EXTENSION_BASE:=peas_extension_base_get_type;
  end;


end.
