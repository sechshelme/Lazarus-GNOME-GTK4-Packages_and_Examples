
unit xb_stack;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_stack.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_stack.h
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
PXbOpcode  = ^XbOpcode;
PXbStack  = ^XbStack;
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
{$include "xb-opcode.h"}
type

function xb_stack_get_type:TGType;cdecl;external;
function xb_stack_to_string(self:PXbStack):Pgchar;cdecl;external;
function xb_stack_pop(self:PXbStack; opcode_out:PXbOpcode; error:PPGError):Tgboolean;cdecl;external;
function xb_stack_push(self:PXbStack; opcode_out:PPXbOpcode; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
