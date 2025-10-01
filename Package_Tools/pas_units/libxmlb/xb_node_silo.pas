unit xb_node_silo;

interface

uses
  fp_glib2, fp_xmlb;

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

function xb_node_get_silo(self:PXbNode):PXbSilo;cdecl;external libxmlb;

// === Konventiert am: 1-10-25 19:42:29 ===


implementation



end.
