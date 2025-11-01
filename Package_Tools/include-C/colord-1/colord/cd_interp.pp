
unit cd_interp;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_interp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_interp.h
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
PCdInterp  = ^CdInterp;
PCdInterpClass  = ^CdInterpClass;
PCdInterpError  = ^CdInterpError;
PCdInterpKind  = ^CdInterpKind;
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2013 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_INTERP_H}
{$define __CD_INTERP_H}
{$include <glib-object.h>}

{ was #define dname def_expr }
function CD_INTERP_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_INTERP_TYPE_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_TYPE_INTERP : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdInterp, cd_interp, CD, INTERP, GObject) }
{< private > }
{ Padding for future expansion  }
type
  PCdInterpClass = ^TCdInterpClass;
  TCdInterpClass = record
      parent_class : TGObjectClass;
      prepare : function (interp:PCdInterp; error:PPGError):Tgboolean;cdecl;
      eval : function (interp:PCdInterp; value:Tgdouble; error:PPGError):Tgdouble;cdecl;
      _cd_interp_reserved1 : procedure ;cdecl;
      _cd_interp_reserved2 : procedure ;cdecl;
      _cd_interp_reserved3 : procedure ;cdecl;
      _cd_interp_reserved4 : procedure ;cdecl;
      _cd_interp_reserved5 : procedure ;cdecl;
      _cd_interp_reserved6 : procedure ;cdecl;
      _cd_interp_reserved7 : procedure ;cdecl;
      _cd_interp_reserved8 : procedure ;cdecl;
    end;

{*
 * CdInterpError:
 * @CD_INTERP_ERROR_FAILED: the method failed for an unknown reason
 *
 * Errors that can be thrown
  }
{< private > }

  PCdInterpError = ^TCdInterpError;
  TCdInterpError =  Longint;
  Const
    CD_INTERP_ERROR_FAILED = 0;
    CD_INTERP_ERROR_LAST = 1;
;
{*
 * CdInterpKind:
 *
 * The kind of interpolation.
 * }
{< private > }
type
  PCdInterpKind = ^TCdInterpKind;
  TCdInterpKind =  Longint;
  Const
    CD_INTERP_KIND_LINEAR = 0;
    CD_INTERP_KIND_AKIMA = 1;
    CD_INTERP_KIND_LAST = 2;
;

function cd_interp_error_quark:TGQuark;cdecl;external;
function cd_interp_get_kind(interp:PCdInterp):TCdInterpKind;cdecl;external;
function cd_interp_get_x(interp:PCdInterp):PGArray;cdecl;external;
function cd_interp_get_y(interp:PCdInterp):PGArray;cdecl;external;
function cd_interp_get_size(interp:PCdInterp):Tguint;cdecl;external;
procedure cd_interp_insert(interp:PCdInterp; x:Tgdouble; y:Tgdouble);cdecl;external;
function cd_interp_prepare(interp:PCdInterp; error:PPGError):Tgboolean;cdecl;external;
function cd_interp_eval(interp:PCdInterp; value:Tgdouble; error:PPGError):Tgdouble;cdecl;external;
(* Const before type ignored *)
function cd_interp_kind_to_string(kind:TCdInterpKind):Pgchar;cdecl;external;
{$endif}
{ __CD_INTERP_H  }

implementation

{ was #define dname def_expr }
function CD_INTERP_ERROR : longint; { return type might be wrong }
  begin
    CD_INTERP_ERROR:=cd_interp_error_quark;
  end;

{ was #define dname def_expr }
function CD_INTERP_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_INTERP_TYPE_ERROR:=cd_interp_error_get_type;
  end;

{ was #define dname def_expr }
function CD_TYPE_INTERP : longint; { return type might be wrong }
  begin
    CD_TYPE_INTERP:=cd_interp_get_type;
  end;


end.
