
unit xb_silo;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_silo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_silo.h
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
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
PXbNode  = ^XbNode;
PXbQuery  = ^XbQuery;
PXbSilo  = ^XbSilo;
PXbSiloClass  = ^XbSiloClass;
PXbSiloLoadFlags  = ^XbSiloLoadFlags;
PXbSiloProfileFlags  = ^XbSiloProfileFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}
{$include <glib-object.h>}
{$include <glib.h>}
{$include "xb-node.h"}

{ was #define dname def_expr }
function XB_TYPE_SILO : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(XbSilo, xb_silo, XB, SILO, GObject) }
{< private > }
type
  PXbSiloClass = ^TXbSiloClass;
  TXbSiloClass = record
      parent_class : TGObjectClass;
      _xb_reserved1 : procedure ;cdecl;
      _xb_reserved2 : procedure ;cdecl;
      _xb_reserved3 : procedure ;cdecl;
      _xb_reserved4 : procedure ;cdecl;
      _xb_reserved5 : procedure ;cdecl;
      _xb_reserved6 : procedure ;cdecl;
      _xb_reserved7 : procedure ;cdecl;
    end;

{*
 * XbSiloLoadFlags:
 * @XB_SILO_LOAD_FLAG_NONE:			No extra flags to use
 * @XB_SILO_LOAD_FLAG_NO_MAGIC:			No not check header signature
 * @XB_SILO_LOAD_FLAG_WATCH_BLOB:		Watch the XMLB file for changes
 *
 * The flags for loading a silo.
 * }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{< private > }

  PXbSiloLoadFlags = ^TXbSiloLoadFlags;
  TXbSiloLoadFlags =  Longint;
  Const
    XB_SILO_LOAD_FLAG_NONE = 0;
    XB_SILO_LOAD_FLAG_NO_MAGIC = 1 shl 0;
    XB_SILO_LOAD_FLAG_WATCH_BLOB = 1 shl 1;
    XB_SILO_LOAD_FLAG_LAST = (1 shl 1)+1;
;
{*
 * XbSiloProfileFlags:
 * @XB_SILO_PROFILE_FLAG_NONE:			No extra flags to use
 * @XB_SILO_PROFILE_FLAG_DEBUG:			Output profiling as debug
 * @XB_SILO_PROFILE_FLAG_APPEND:		Save profiling in an appended string
 * @XB_SILO_PROFILE_FLAG_XPATH:			Save XPATH queries
 * @XB_SILO_PROFILE_FLAG_OPTIMIZER:		Output the machine optimizer as debug
 *
 * The flags used when profiling a silo.
 * }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.3.1  }
{< private > }
type
  PXbSiloProfileFlags = ^TXbSiloProfileFlags;
  TXbSiloProfileFlags =  Longint;
  Const
    XB_SILO_PROFILE_FLAG_NONE = 0;
    XB_SILO_PROFILE_FLAG_DEBUG = 1 shl 0;
    XB_SILO_PROFILE_FLAG_APPEND = 1 shl 1;
    XB_SILO_PROFILE_FLAG_XPATH = 1 shl 2;
    XB_SILO_PROFILE_FLAG_OPTIMIZER = 1 shl 3;
    XB_SILO_PROFILE_FLAG_LAST = (1 shl 3)+1;
;

function xb_silo_new:PXbSilo;cdecl;external;
(* Const before type ignored *)
function xb_silo_new_from_xml(xml:Pgchar; error:PPGError):PXbSilo;cdecl;external;
function xb_silo_get_bytes(self:PXbSilo):PGBytes;cdecl;external;
function xb_silo_load_from_bytes(self:PXbSilo; blob:PGBytes; flags:TXbSiloLoadFlags; error:PPGError):Tgboolean;cdecl;external;
function xb_silo_load_from_file(self:PXbSilo; file:PGFile; flags:TXbSiloLoadFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function xb_silo_save_to_file(self:PXbSilo; file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
function xb_silo_to_string(self:PXbSilo; error:PPGError):Pgchar;cdecl;external;
function xb_silo_get_size(self:PXbSilo):Tguint;cdecl;external;
(* Const before type ignored *)
function xb_silo_get_guid(self:PXbSilo):Pgchar;cdecl;external;
function xb_silo_get_root(self:PXbSilo):PXbNode;cdecl;external;
procedure xb_silo_invalidate(self:PXbSilo);cdecl;external;
function xb_silo_is_valid(self:PXbSilo):Tgboolean;cdecl;external;
function xb_silo_watch_file(self:PXbSilo; file:PGFile; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure xb_silo_set_profile_flags(self:PXbSilo; profile_flags:TXbSiloProfileFlags);cdecl;external;
(* Const before type ignored *)
function xb_silo_get_profile_string(self:PXbSilo):Pgchar;cdecl;external;
function xb_silo_get_enable_node_cache(self:PXbSilo):Tgboolean;cdecl;external;
procedure xb_silo_set_enable_node_cache(self:PXbSilo; enable_node_cache:Tgboolean);cdecl;external;
{$include "xb-query.h"}
(* Const before type ignored *)

function xb_silo_lookup_query(self:PXbSilo; xpath:Pgchar):PXbQuery;cdecl;external;

implementation

{ was #define dname def_expr }
function XB_TYPE_SILO : longint; { return type might be wrong }
  begin
    XB_TYPE_SILO:=xb_silo_get_type;
  end;


end.
