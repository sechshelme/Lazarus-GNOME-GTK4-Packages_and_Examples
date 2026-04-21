
unit fwupd_plugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_plugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_plugin.h
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
PFwupdPlugin  = ^FwupdPlugin;
PFwupdPluginClass  = ^FwupdPluginClass;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include "fwupd-enums.h"}

{ was #define dname def_expr }
function FWUPD_TYPE_PLUGIN : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE(FwupdPlugin, fwupd_plugin, FWUPD, PLUGIN, GObject) }
{< private > }
type
  PFwupdPluginClass = ^TFwupdPluginClass;
  TFwupdPluginClass = record
      parent_class : TGObjectClass;
      _fwupd_reserved1 : procedure ;cdecl;
      _fwupd_reserved2 : procedure ;cdecl;
      _fwupd_reserved3 : procedure ;cdecl;
      _fwupd_reserved4 : procedure ;cdecl;
      _fwupd_reserved5 : procedure ;cdecl;
      _fwupd_reserved6 : procedure ;cdecl;
      _fwupd_reserved7 : procedure ;cdecl;
    end;


function fwupd_plugin_new:PFwupdPlugin;cdecl;external;
function fwupd_plugin_to_string(self:PFwupdPlugin):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_plugin_get_name(self:PFwupdPlugin):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure fwupd_plugin_set_name(self:PFwupdPlugin; name:Pgchar);cdecl;external;
function fwupd_plugin_get_flags(self:PFwupdPlugin):Tguint64;cdecl;external;
procedure fwupd_plugin_set_flags(self:PFwupdPlugin; flags:Tguint64);cdecl;external;
procedure fwupd_plugin_add_flag(self:PFwupdPlugin; flag:TFwupdPluginFlags);cdecl;external;
procedure fwupd_plugin_remove_flag(self:PFwupdPlugin; flag:TFwupdPluginFlags);cdecl;external;
function fwupd_plugin_has_flag(self:PFwupdPlugin; flag:TFwupdPluginFlags):Tgboolean;cdecl;external;
function fwupd_plugin_from_variant(value:PGVariant):PFwupdPlugin;cdecl;external;
function fwupd_plugin_array_from_variant(value:PGVariant):PGPtrArray;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_TYPE_PLUGIN : longint; { return type might be wrong }
  begin
    FWUPD_TYPE_PLUGIN:=fwupd_plugin_get_type;
  end;


end.
