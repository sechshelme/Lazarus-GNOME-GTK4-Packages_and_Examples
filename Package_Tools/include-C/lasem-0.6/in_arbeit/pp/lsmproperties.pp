
unit lsmproperties;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmproperties.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmproperties.h
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
PGSList  = ^GSList;
PLsmProperty  = ^LsmProperty;
PLsmPropertyBag  = ^LsmPropertyBag;
PLsmPropertyInfos  = ^LsmPropertyInfos;
PLsmPropertyManager  = ^LsmPropertyManager;
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
{$ifndef LSM_PROPERTIES_H}
{$define LSM_PROPERTIES_H}
{$include <lsmtypes.h>}
{$include <lsmtraits.h>}
type
  PLsmProperty = ^TLsmProperty;
  TLsmProperty = record
      id : Tguint16;
      flags : Tguint16;
      value : Pchar;
    end;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PLsmPropertyInfos = ^TLsmPropertyInfos;
  TLsmPropertyInfos = record
      name : Pchar;
      id : Tguint16;
      trait_class : PLsmTraitClass;
      trait_default : Pchar;
    end;

  PLsmPropertyBag = ^TLsmPropertyBag;
  TLsmPropertyBag = record
      properties : PGSList;
    end;

{ was #define dname def_expr }
function LSM_TYPE_PROPERTY_MANAGER : longint; { return type might be wrong }

function lsm_property_manager_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_property_manager_new(n_properties:dword; property_infos:PLsmPropertyInfos):PLsmPropertyManager;cdecl;external;
function lsm_property_manager_ref(manager:PLsmPropertyManager):PLsmPropertyManager;cdecl;external;
procedure lsm_property_manager_unref(manager:PLsmPropertyManager);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_property_manager_set_property(manager:PLsmPropertyManager; property_bag:PLsmPropertyBag; name:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lsm_property_manager_get_property(manager:PLsmPropertyManager; property_bag:PLsmPropertyBag; name:Pchar):Pchar;cdecl;external;
procedure lsm_property_manager_clean_properties(manager:PLsmPropertyManager; property_bag:PLsmPropertyBag);cdecl;external;
function lsm_property_manager_serialize(property_manager:PLsmPropertyManager; property_bag:PLsmPropertyBag):Pchar;cdecl;external;
(* Const before type ignored *)
procedure lsm_property_manager_apply_property_bag(property_manager:PLsmPropertyManager; property_bag:PLsmPropertyBag; style:pointer; parent_style:pointer);cdecl;external;
procedure lsm_property_manager_init_default_style(property_manager:PLsmPropertyManager; style:pointer);cdecl;external;
procedure lsm_property_bag_init(bag:PLsmPropertyBag);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_PROPERTY_MANAGER : longint; { return type might be wrong }
  begin
    LSM_TYPE_PROPERTY_MANAGER:=lsm_property_manager_get_type;
  end;


end.
