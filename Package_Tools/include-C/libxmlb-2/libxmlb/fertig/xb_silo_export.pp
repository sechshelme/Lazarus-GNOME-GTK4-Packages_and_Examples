
unit xb_silo_export;
interface

{
  Automatically converted by H2Pas 1.0.0 from xb_silo_export.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xb_silo_export.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGFile  = ^GFile;
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
{$include "xb-silo.h"}

function xb_silo_export(self:PXbSilo; flags:TXbNodeExportFlags; error:PPGError):Pgchar;cdecl;external;
function xb_silo_export_file(self:PXbSilo; file:PGFile; flags:TXbNodeExportFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;

implementation


end.
