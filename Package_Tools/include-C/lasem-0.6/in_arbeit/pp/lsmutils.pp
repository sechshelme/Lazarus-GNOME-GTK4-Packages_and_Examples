
unit lsmutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmutils.h
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
PLsmBox  = ^LsmBox;
PLsmExtents  = ^LsmExtents;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2012 Emmanuel Pacaud
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
{$ifndef LSM_UTILS_H}
{$define LSM_UTILS_H}
{$include <lsmtypes.h>}
type
  PLsmExtents = ^TLsmExtents;
  TLsmExtents = record
      x1 : Tdouble;
      y1 : Tdouble;
      x2 : Tdouble;
      y2 : Tdouble;
    end;


{ was #define dname def_expr }
function LSM_TYPE_EXTENTS : longint; { return type might be wrong }

function lsm_extents_get_type:TGType;cdecl;external;
type
  PLsmBox = ^TLsmBox;
  TLsmBox = record
      x : Tdouble;
      y : Tdouble;
      width : Tdouble;
      height : Tdouble;
    end;


{ was #define dname def_expr }
function LSM_TYPE_BOX : longint; { return type might be wrong }

function lsm_box_get_type:TGType;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_EXTENTS : longint; { return type might be wrong }
  begin
    LSM_TYPE_EXTENTS:=lsm_extents_get_type;
  end;

{ was #define dname def_expr }
function LSM_TYPE_BOX : longint; { return type might be wrong }
  begin
    LSM_TYPE_BOX:=lsm_box_get_type;
  end;


end.
