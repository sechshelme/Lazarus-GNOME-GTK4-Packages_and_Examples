
unit lsmattributes;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmattributes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmattributes.h
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
PLsmAttribute  = ^LsmAttribute;
PLsmAttributeInfos  = ^LsmAttributeInfos;
PLsmAttributeManager  = ^LsmAttributeManager;
PLsmTraitClass  = ^LsmTraitClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2009 Emmanuel Pacaud
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
{$ifndef LSM_ATTRIBUTES_H}
{$define LSM_ATTRIBUTES_H}
{$include <lsmtypes.h>}
{$include <lsmtraits.h>}
type
  PLsmAttribute = ^TLsmAttribute;
  TLsmAttribute = record
      value : Pchar;
    end;
(* Const before type ignored *)

function lsm_attribute_is_defined(attribute:PLsmAttribute):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PLsmAttributeInfos = ^TLsmAttributeInfos;
  TLsmAttributeInfos = record
      name : Pchar;
      attribute_offset : longint;
      trait_class : PLsmTraitClass;
      trait_default : pointer;
    end;

{ was #define dname def_expr }
function LSM_TYPE_ATTRIBUTE_MANAGER : longint; { return type might be wrong }

function lsm_attribute_manager_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_attribute_manager_new(n_attributes:dword; attribute_infos:PLsmAttributeInfos):PLsmAttributeManager;cdecl;external;
(* Const before type ignored *)
function lsm_attribute_manager_duplicate(origin:PLsmAttributeManager):PLsmAttributeManager;cdecl;external;
function lsm_attribute_manager_ref(manager:PLsmAttributeManager):PLsmAttributeManager;cdecl;external;
procedure lsm_attribute_manager_unref(manager:PLsmAttributeManager);cdecl;external;
(* Const before type ignored *)
procedure lsm_attribute_manager_add_attributes(manager:PLsmAttributeManager; n_attributes:dword; attribute_infos:PLsmAttributeInfos);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function lsm_attribute_manager_set_attribute(manager:PLsmAttributeManager; instance:pointer; name:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function lsm_attribute_manager_get_attribute(manager:PLsmAttributeManager; instance:pointer; name:Pchar):Pchar;cdecl;external;
procedure lsm_attribute_manager_clean_attributes(manager:PLsmAttributeManager; instance:pointer);cdecl;external;
function lsm_attribute_manager_serialize(manager:PLsmAttributeManager; instance:pointer):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_ATTRIBUTE_MANAGER : longint; { return type might be wrong }
  begin
    LSM_TYPE_ATTRIBUTE_MANAGER:=lsm_attribute_manager_get_type;
  end;


end.
