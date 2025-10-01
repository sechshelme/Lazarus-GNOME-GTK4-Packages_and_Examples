
unit xb_silo_query;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_silo_query.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_silo_query.h
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
{$include "xb-node.h"}
{$include "xb-query-context.h"}
{$include "xb-query.h"}
{$include "xb-silo.h"}
(* Const before type ignored *)

function xb_silo_query(self:PXbSilo; xpath:Pgchar; limit:Tguint; error:PPGError):PGPtrArray;cdecl;external;
function xb_silo_query_full(self:PXbSilo; query:PXbQuery; error:PPGError):PGPtrArray;cdecl;external;
function xb_silo_query_with_context(self:PXbSilo; query:PXbQuery; context:PXbQueryContext; error:PPGError):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function xb_silo_query_first(self:PXbSilo; xpath:Pgchar; error:PPGError):PXbNode;cdecl;external;
function xb_silo_query_first_full(self:PXbSilo; query:PXbQuery; error:PPGError):PXbNode;cdecl;external;
function xb_silo_query_first_with_context(self:PXbSilo; query:PXbQuery; context:PXbQueryContext; error:PPGError):PXbNode;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xb_silo_query_build_index(self:PXbSilo; xpath:Pgchar; attr:Pgchar; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
