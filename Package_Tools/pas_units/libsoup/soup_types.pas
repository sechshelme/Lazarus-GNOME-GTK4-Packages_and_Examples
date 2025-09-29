unit soup_types;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2003, Ximian, Inc.
  }
{$ifndef __SOUP_TYPES_H__}

const
  __SOUP_TYPES_H__ = 1;  
{$include <gio/gio.h>}
{$include "soup-version.h"}
{$include "soup-status.h"}
{#define _SOUP_ATOMIC_INTERN_STRING(variable, value) ((const char *)(g_atomic_pointer_get (&(variable)) ? (variable) : (g_atomic_pointer_set (&(variable), (gpointer)g_intern_static_string (value)), (variable)))) }
type
{$endif}
{ __SOUP_TYPES_H__  }

// === Konventiert am: 29-9-25 19:43:53 ===


implementation



end.
