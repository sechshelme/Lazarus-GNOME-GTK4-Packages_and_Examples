
unit cd_edid;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_edid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_edid.h
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
PCdColorYxy  = ^CdColorYxy;
PCdEdid  = ^CdEdid;
PCdEdidClass  = ^CdEdidClass;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
Pxxxxxxxxx  = ^xxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009-2013 Richard Hughes <richard@hughsie.com>
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
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_EDID_H}
{$define __CD_EDID_H}
{$include <glib-object.h>}
{$include "cd-color.h"}

{ was #define dname def_expr }
function CD_EDID_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_EDID : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdEdid, cd_edid, CD, EDID, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdEdidClass = ^TCdEdidClass;
  TCdEdidClass = record
      parent_class : TGObjectClass;
      _cd_edid_reserved1 : procedure ;cdecl;
      _cd_edid_reserved2 : procedure ;cdecl;
      _cd_edid_reserved3 : procedure ;cdecl;
      _cd_edid_reserved4 : procedure ;cdecl;
      _cd_edid_reserved5 : procedure ;cdecl;
      _cd_edid_reserved6 : procedure ;cdecl;
      _cd_edid_reserved7 : procedure ;cdecl;
      _cd_edid_reserved8 : procedure ;cdecl;
    end;

{*
 * CdEdidError:
 * @CD_EDID_ERROR_FAILED_TO_PARSE:	The EDID file could not be found
 *
 * The CdEdid error code.
 * }
{ Since: 1.1.2  }
{< private > }
  Txxxxxxxxx =  Longint;
  Const
    CD_EDID_ERROR_FAILED_TO_PARSE = 0;
    CD_EDID_ERROR_LAST = 1;


function cd_edid_error_quark:TGQuark;cdecl;external;
function cd_edid_new:PCdEdid;cdecl;external;
procedure cd_edid_reset(edid:PCdEdid);cdecl;external;
function cd_edid_parse(edid:PCdEdid; edid_data:PGBytes; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_monitor_name(edid:PCdEdid):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_vendor_name(edid:PCdEdid):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_serial_number(edid:PCdEdid):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_eisa_id(edid:PCdEdid):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_checksum(edid:PCdEdid):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_pnp_id(edid:PCdEdid):Pgchar;cdecl;external;
function cd_edid_get_width(edid:PCdEdid):Tguint;cdecl;external;
function cd_edid_get_height(edid:PCdEdid):Tguint;cdecl;external;
function cd_edid_get_gamma(edid:PCdEdid):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_red(edid:PCdEdid):PCdColorYxy;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_green(edid:PCdEdid):PCdColorYxy;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_blue(edid:PCdEdid):PCdColorYxy;cdecl;external;
(* Const before type ignored *)
function cd_edid_get_white(edid:PCdEdid):PCdColorYxy;cdecl;external;
{$endif}
{ __CD_EDID_H  }

implementation

{ was #define dname def_expr }
function CD_EDID_ERROR : longint; { return type might be wrong }
  begin
    CD_EDID_ERROR:=cd_edid_error_quark;
  end;

{ was #define dname def_expr }
function CD_TYPE_EDID : longint; { return type might be wrong }
  begin
    CD_TYPE_EDID:=cd_edid_get_type;
  end;


end.
