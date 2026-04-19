unit nm_conn_utils;

interface

uses
  fp_glib2, fp_nm;

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

function nm_conn_wireguard_import(filename:Pchar; error:PPGError):PNMConnection;cdecl;external libnm;
{$endif}
{ __NM_WIREGUARD_IMPORT_H__  }

// === Konventiert am: 19-4-26 19:32:37 ===


implementation



end.
