
unit xb_node_query;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_node_query.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_node_query.h
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
PGPtrArray  = ^GPtrArray;
PXbNode  = ^XbNode;
PXbQuery  = ^XbQuery;
PXbQueryContext  = ^XbQueryContext;
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
{$include "xb-node.h"}
{$include "xb-query-context.h"}
{$include "xb-query.h"}
(* Const before type ignored *)

function xb_node_query(self:PXbNode; xpath:Pgchar; limit:Tguint; error:PPGError):PGPtrArray;cdecl;external;
function xb_node_query_full(self:PXbNode; query:PXbQuery; error:PPGError):PGPtrArray;cdecl;external;
function xb_node_query_with_context(self:PXbNode; query:PXbQuery; context:PXbQueryContext; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function xb_node_query_first(self:PXbNode; xpath:Pgchar; error:PPGError):PXbNode;cdecl;external;
function xb_node_query_first_full(self:PXbNode; query:PXbQuery; error:PPGError):PXbNode;cdecl;external;
function xb_node_query_first_with_context(self:PXbNode; query:PXbQuery; context:PXbQueryContext; error:PPGError):PXbNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_node_query_text(self:PXbNode; xpath:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function xb_node_query_text_as_uint(self:PXbNode; xpath:Pgchar; error:PPGError):Tguint64;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xb_node_query_attr(self:PXbNode; xpath:Pgchar; name:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_node_query_attr_as_uint(self:PXbNode; xpath:Pgchar; name:Pgchar; error:PPGError):Tguint64;cdecl;external;
(* Const before type ignored *)
function xb_node_query_export(self:PXbNode; xpath:Pgchar; error:PPGError):Pgchar;cdecl;external;

implementation


end.
