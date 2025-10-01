
unit xb_query;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_query.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_query.h
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
PXbQuery  = ^XbQuery;
PXbQueryClass  = ^XbQueryClass;
PXbQueryFlags  = ^XbQueryFlags;
PXbSilo  = ^XbSilo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}

{ was #define dname def_expr }
function XB_TYPE_QUERY : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE(XbQuery, xb_query, XB, QUERY, GObject) }
{< private > }
type
  PXbQueryClass = ^TXbQueryClass;
  TXbQueryClass = record
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
 * XbQueryFlags:
 * @XB_QUERY_FLAG_NONE:			No extra flags to use
 * @XB_QUERY_FLAG_OPTIMIZE:		Optimize the query when possible
 * @XB_QUERY_FLAG_USE_INDEXES:		Use the indexed parameters
 * @XB_QUERY_FLAG_REVERSE:		Reverse the results order
 * @XB_QUERY_FLAG_FORCE_NODE_CACHE:	Always cache the #XbNode objects
 *
 * The flags used for queries.
 * }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.15  }
{ Since: 0.2.0  }
{< private > }

  PXbQueryFlags = ^TXbQueryFlags;
  TXbQueryFlags =  Longint;
  Const
    XB_QUERY_FLAG_NONE = 0;
    XB_QUERY_FLAG_OPTIMIZE = 1 shl 0;
    XB_QUERY_FLAG_USE_INDEXES = 1 shl 1;
    XB_QUERY_FLAG_REVERSE = 1 shl 2;
    XB_QUERY_FLAG_FORCE_NODE_CACHE = 1 shl 3;
    XB_QUERY_FLAG_LAST = (1 shl 3)+1;
;
{$include "xb-silo.h"}
(* Const before type ignored *)

function xb_query_new(silo:PXbSilo; xpath:Pgchar; error:PPGError):PXbQuery;cdecl;external;
(* Const before type ignored *)
function xb_query_new_full(silo:PXbSilo; xpath:Pgchar; flags:TXbQueryFlags; error:PPGError):PXbQuery;cdecl;external;
(* Const before type ignored *)
function xb_query_get_xpath(self:PXbQuery):Pgchar;cdecl;external;
function xb_query_get_limit(self:PXbQuery):Tguint;cdecl;external;
{ G_DEPRECATED_FOR(xb_query_context_get_limit) }
procedure xb_query_set_limit(self:PXbQuery; limit:Tguint);cdecl;external;
{ G_DEPRECATED_FOR(xb_query_context_set_limit) }
function xb_query_get_flags(self:PXbQuery):TXbQueryFlags;cdecl;external;
{ G_DEPRECATED_FOR(xb_query_context_get_flags) }
procedure xb_query_set_flags(self:PXbQuery; flags:TXbQueryFlags);cdecl;external;
{ G_DEPRECATED_FOR(xb_query_context_set_flags) }
(* Const before type ignored *)
function xb_query_bind_str(self:PXbQuery; idx:Tguint; str:Pgchar; error:PPGError):Tgboolean;cdecl;external;
{ G_DEPRECATED_FOR(xb_value_bindings_bind_str) }
function xb_query_bind_val(self:PXbQuery; idx:Tguint; val:Tguint32; error:PPGError):Tgboolean;cdecl;external;
{ G_DEPRECATED_FOR(xb_value_bindings_bind_val) }

implementation

{ was #define dname def_expr }
function XB_TYPE_QUERY : longint; { return type might be wrong }
  begin
    XB_TYPE_QUERY:=xb_query_get_type;
  end;


end.
