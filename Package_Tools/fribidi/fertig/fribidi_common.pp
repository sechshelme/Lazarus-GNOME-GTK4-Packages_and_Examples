
unit fribidi_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_common.h
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


{ FriBidi
 * fribidi-common.h - common include for library headers
 *
 * Author:
 *   Behdad Esfahbod, 2004
 *
 * Copyright (C) 2004 Sharif FarsiWeb, Inc.
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library, in a file named COPYING; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA
 * 
 * For licensing issues, contact <fribidi.license@gmail.com>.
  }
{$ifndef _FRIBIDI_COMMON_H}
{$define _FRIBIDI_COMMON_H}
{$ifdef DONT_HAVE_FRIBIDI_CONFIG_H}

const
  FRIBIDI = 'fribidi';  
  FRIBIDI_NAME = 'fribidi';  
  FRIBIDI_VERSION = 'unknown';  
  FRIBIDI_BUGREPORT = 'unknown';  
  FRIBIDI_INTERFACE_VERSION_STRING = 'unknown';  
{$else}
{ !DONT_HAVE_FRIBIDI_CONFIG_H  }
{$include "fribidi-config.h"}
{$endif}
{ !DONT_HAVE_FRIBIDI_CONFIG_H  }
{ fribidi_debug_status - get current debug state
 *
  }

function fribidi_debug_status:longint;cdecl;external;
{ fribidi_set_debug - set debug state
 *
  }
{ new state to set  }
function fribidi_set_debug(state:longint):longint;cdecl;external;
{$endif}
{ !_FRIBIDI_COMMON_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation


end.
