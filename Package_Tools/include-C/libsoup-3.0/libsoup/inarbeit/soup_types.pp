
unit soup_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_types.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

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

implementation


end.
