
unit cd_interp_linear;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_interp_linear.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_interp_linear.h
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
PCdInterpLinearClass  = ^CdInterpLinearClass;
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
{$ifndef __CD_INTERP_LINEAR_H}
{$define __CD_INTERP_LINEAR_H}
{$include <glib-object.h>}
{$include <colord/cd-interp.h>}

{ was #define dname def_expr }
function CD_TYPE_INTERP_LINEAR : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (CdInterpLinear, cd_interp_linear, CD, INTERP_LINEAR, CdInterp) }
type
  PCdInterpLinearClass = ^TCdInterpLinearClass;
  TCdInterpLinearClass = record
      parent_class : TCdInterpClass;
    end;


function cd_interp_linear_new:PCdInterp;cdecl;external;
{$endif}
{ __CD_INTERP_LINEAR_H  }

implementation

{ was #define dname def_expr }
function CD_TYPE_INTERP_LINEAR : longint; { return type might be wrong }
  begin
    CD_TYPE_INTERP_LINEAR:=cd_interp_linear_get_type;
  end;


end.
