unit xb_query_context;

interface

uses
  fp_glib2, fp_xmlb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 * vi:set noexpandtab tabstop=8 shiftwidth=8:
 *
 * Copyright (C) 2020 Endless OS Foundation LLC
 *
 * Author: Philip Withnall <withnall@endlessm.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}
{$include "xb-query.h"}
{$include "xb-value-bindings.h"}
{*
 * XbQueryContext:
 *
 * An opaque struct which contains context for executing a query in, such as the
 * number of results to return, or values to bind to query placeholders.
 *
 * Since: 0.3.0
  }
{< private > }
type
  PXbQueryContext = ^TXbQueryContext;
  TXbQueryContext = record
      dummy0 : Tgint;
      dummy1 : Tguint;
      dummy2 : TXbValueBindings;
      dummy3 : array[0..4] of Tgpointer;
    end;

function xb_query_context_get_type:TGType;cdecl;external libxmlb;
{*
 * XB_QUERY_CONTEXT_INIT:
 *
 * Static initialiser for #XbQueryContext so it can be used on the stack.
 *
 * Use it in association with g_auto(), to ensure the bindings are freed once
 * finished with:
 * |[
 * g_auto(XbQueryContext) context = XB_QUERY_CONTEXT_INIT ();
 *
 * xb_query_context_set_limit (&context, 0);
 * ]|
 *
 * Since: 0.3.0
  }
procedure xb_query_context_init(self:PXbQueryContext);cdecl;external libxmlb;
procedure xb_query_context_clear(self:PXbQueryContext);cdecl;external libxmlb;
function xb_query_context_copy(self:PXbQueryContext):PXbQueryContext;cdecl;external libxmlb;
procedure xb_query_context_free(self:PXbQueryContext);cdecl;external libxmlb;
function xb_query_context_get_bindings(self:PXbQueryContext):PXbValueBindings;cdecl;external libxmlb;
function xb_query_context_get_limit(self:PXbQueryContext):Tguint;cdecl;external libxmlb;
procedure xb_query_context_set_limit(self:PXbQueryContext; limit:Tguint);cdecl;external libxmlb;
function xb_query_context_get_flags(self:PXbQueryContext):TXbQueryFlags;cdecl;external libxmlb;
procedure xb_query_context_set_flags(self:PXbQueryContext; flags:TXbQueryFlags);cdecl;external libxmlb;

// === Konventiert am: 1-10-25 19:42:37 ===


implementation



end.
