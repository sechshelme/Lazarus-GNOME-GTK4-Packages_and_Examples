
unit lsmtraits;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmtraits.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmtraits.h
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
PLsmTrait  = ^LsmTrait;
PLsmTraitClass  = ^LsmTraitClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem - SVG and Mathml library
 *
 * Copyright © 2009-2010  Emmanuel Pacaud
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
{$ifndef LSM_TRAITS_H}
{$define LSM_TRAITS_H}
{$include <lsmtypes.h>}
type
  PLsmTrait = ^TLsmTrait;
  TLsmTrait = pointer;
(* Const before type ignored *)

  PLsmTraitClass = ^TLsmTraitClass;
  TLsmTraitClass = record
      size : Tsize_t;
      init : procedure (abstract_trait:PLsmTrait; trait_default:PLsmTrait);cdecl;
      finalize : procedure (abstract_trait:PLsmTrait);cdecl;
      from_string : function (abstract_trait:PLsmTrait; _string:Pchar):Tgboolean;cdecl;
      to_string : function (abstract_trait:PLsmTrait):Pchar;cdecl;
    end;
(* Const before type ignored *)
  var
    lsm_null_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_boolean_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_integer_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_double_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
    lsm_box_trait_class : TLsmTraitClass;cvar;external;
(* Const before type ignored *)
(* Const before type ignored *)

function lsm_enum_value_from_string(_string:Pchar; strings:PPchar; n_strings:dword):longint;cdecl;external;
{$endif}

implementation


end.
