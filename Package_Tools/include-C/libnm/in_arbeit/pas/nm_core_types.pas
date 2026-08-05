unit nm_core_types;

interface

uses
  fp_glib2, fp_bm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2014 - 2018 Red Hat, Inc.
  }
{$ifndef __NM_CORE_TYPES_H__}
{$define __NM_CORE_TYPES_H__}
{$include <glib-object.h>}
{$include "nm-version.h"}
{$include "nm-dbus-interface.h"}
{$include "nm-core-enum-types.h"}
type

  TNMUtilsPredicateStr = function (str:Pchar):Tgboolean;cdecl;
{$endif}
{ __NM_CORE_TYPES_H__  }

// === Konventiert am: 5-8-26 17:06:30 ===


implementation



end.
