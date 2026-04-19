
unit nm-conn-utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-conn-utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-conn-utils.h
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
Pchar  = ^char;
PGError  = ^GError;
PNMConnection  = ^NMConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 - 2015 Red Hat, Inc.
  }
{$ifndef __NM_WIREGUARD_IMPORT_H__}
{$define __NM_WIREGUARD_IMPORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}
(* Const before type ignored *)

function nm_conn_wireguard_import(filename:Pchar; error:PPGError):PNMConnection;cdecl;external;
{$endif}
{ __NM_WIREGUARD_IMPORT_H__  }

implementation


end.
