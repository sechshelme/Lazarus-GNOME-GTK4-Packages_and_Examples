
unit xb_builder_fixup;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_builder_fixup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_builder_fixup.h
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
PGError  = ^GError;
PXbBuilderFixup  = ^XbBuilderFixup;
PXbBuilderFixupClass  = ^XbBuilderFixupClass;
PXbBuilderNode  = ^XbBuilderNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-builder-node.h"}

{ was #define dname def_expr }
function XB_TYPE_BUILDER_FIXUP : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(XbBuilderFixup, xb_builder_fixup, XB, BUILDER_FIXUP, GObject) }
{< private > }
type
  PXbBuilderFixupClass = ^TXbBuilderFixupClass;
  TXbBuilderFixupClass = record
      parent_class : TGObjectClass;
      _xb_reserved1 : procedure ;cdecl;
      _xb_reserved2 : procedure ;cdecl;
      _xb_reserved3 : procedure ;cdecl;
      _xb_reserved4 : procedure ;cdecl;
      _xb_reserved5 : procedure ;cdecl;
      _xb_reserved6 : procedure ;cdecl;
      _xb_reserved7 : procedure ;cdecl;
    end;


  TXbBuilderFixupFunc = function (self:PXbBuilderFixup; bn:PXbBuilderNode; user_data:Tgpointer; error:PPGError):Tgboolean;cdecl;
(* Const before type ignored *)

function xb_builder_fixup_new(id:Pgchar; func:TXbBuilderFixupFunc; user_data:Tgpointer; user_data_free:TGDestroyNotify):PXbBuilderFixup;cdecl;external;
function xb_builder_fixup_get_max_depth(self:PXbBuilderFixup):Tgint;cdecl;external;
procedure xb_builder_fixup_set_max_depth(self:PXbBuilderFixup; max_depth:Tgint);cdecl;external;

implementation

{ was #define dname def_expr }
function XB_TYPE_BUILDER_FIXUP : longint; { return type might be wrong }
  begin
    XB_TYPE_BUILDER_FIXUP:=xb_builder_fixup_get_type;
  end;


end.
