
unit xb_node_silo;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_node_silo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_node_silo.h
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
PXbNode  = ^XbNode;
PXbSilo  = ^XbSilo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "xb-node.h"}
{$include "xb-silo.h"}

function xb_node_get_silo(self:PXbNode):PXbSilo;cdecl;external;

implementation


end.
