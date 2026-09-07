
unit pk_package_ids;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_package_ids.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_package_ids.h
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
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2008-2009 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_PACKAGE_IDS_H}
{$define __PK_PACKAGE_IDS_H}
{$include <glib.h>}
{ rationale:
 *
 * '%': breaks printf
 * '|': used as the filename separator
 * '~': conary
 * '@': conary
 *
 * If this has to be changed, also change:
 * - backends/urpmi/helpers/urpmi-dispatched-backend.pl
 * - python/packagekit/backend.py
  }

const
  PK_PACKAGE_IDS_DELIM = '&';  
(* Const before type ignored *)

function pk_package_ids_from_id(package_id:Pgchar):^Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_package_ids_from_string(package_id:Pgchar):^Pgchar;cdecl;external;
function pk_package_ids_check(package_ids:PPgchar):Tgboolean;cdecl;external;
function pk_package_ids_to_string(package_ids:PPgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_package_ids_present_id(package_ids:PPgchar; package_id:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_package_ids_add_id(package_ids:PPgchar; package_id:Pgchar):^Pgchar;cdecl;external;
function pk_package_ids_add_ids(package_ids:PPgchar; package_ids_new:PPgchar):^Pgchar;cdecl;external;
(* Const before type ignored *)
function pk_package_ids_remove_id(package_ids:PPgchar; package_id:Pgchar):^Pgchar;cdecl;external;
{ compat defines for old versions  }
{*
 * pk_package_ids_from_text:
 * @package_id: A single package_id
 *
 * Form a composite string array of package_id's from
 * a delimited string
 *
 * Return value: (transfer full): the string array, or %NULL if invalid, free with g_strfreev()
 *
 * Deprecated: Use pk_package_ids_from_string()
  }
const
  pk_package_ids_from_text = pk_package_ids_from_string;  
{*
 * pk_package_ids_to_text:
 * @package_ids: a string array of package_id's
 *
 * Cats the string array of package_id's into one delimited string
 * Return value: a string representation of all the package_id's.
 *
 * Deprecated: pk_package_ids_to_string()
  }
  pk_package_ids_to_text = pk_package_ids_to_string;  
{$endif}
{ __PK_PACKAGE_IDS_H  }

implementation


end.
