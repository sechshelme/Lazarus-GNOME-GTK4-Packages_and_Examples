
unit xb_value_bindings;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_value_bindings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_value_bindings.h
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
PXbOpcode  = ^XbOpcode;
PXbValueBindings  = ^XbValueBindings;
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
{$include "xb-opcode.h"}
{*
 * XbValueBindings:
 *
 * An opaque struct which contains values bound to a query.
 *
 * Since: 0.3.0
  }
{< private > }
type
  PXbValueBindings = ^TXbValueBindings;
  TXbValueBindings = record
      dummy0 : Tguint8;
      dummy1 : Tguint32;
      dummy2 : array[0..1] of Tgpointer;
      dummy3 : Tguint8;
      dummy4 : Tguint32;
      dummy5 : array[0..1] of Tgpointer;
      dummy6 : Tguint8;
      dummy7 : Tguint32;
      dummy8 : array[0..1] of Tgpointer;
      dummy9 : Tguint8;
      dummy10 : Tguint32;
      dummy11 : array[0..1] of Tgpointer;
      dummy12 : array[0..2] of Tgpointer;
    end;

function xb_value_bindings_get_type:TGType;cdecl;external;
{*
 * XB_VALUE_BINDINGS_INIT:
 *
 * Static initialiser for #XbValueBindings so it can be used on the stack.
 *
 * Use it in association with g_auto(), to ensure the bindings are freed once
 * finished with:
 * |[
 * g_auto(XbValueBindings) bindings = XB_VALUE_BINDINGS_INIT ();
 *
 * xb_value_bindings_bind_str (&bindings, 0, "test", NULL);
 * ]|
 *
 * Since: 0.3.0
  }
procedure xb_value_bindings_init(self:PXbValueBindings);cdecl;external;
procedure xb_value_bindings_clear(self:PXbValueBindings);cdecl;external;
function xb_value_bindings_copy(self:PXbValueBindings):PXbValueBindings;cdecl;external;
procedure xb_value_bindings_free(self:PXbValueBindings);cdecl;external;
function xb_value_bindings_is_bound(self:PXbValueBindings; idx:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure xb_value_bindings_bind_str(self:PXbValueBindings; idx:Tguint; str:Pgchar; destroy_func:TGDestroyNotify);cdecl;external;
procedure xb_value_bindings_bind_val(self:PXbValueBindings; idx:Tguint; val:Tguint32);cdecl;external;
function xb_value_bindings_lookup_opcode(self:PXbValueBindings; idx:Tguint; opcode_out:PXbOpcode):Tgboolean;cdecl;external;
function xb_value_bindings_copy_binding(self:PXbValueBindings; idx:Tguint; dest:PXbValueBindings; dest_idx:Tguint):Tgboolean;cdecl;external;

implementation


end.
