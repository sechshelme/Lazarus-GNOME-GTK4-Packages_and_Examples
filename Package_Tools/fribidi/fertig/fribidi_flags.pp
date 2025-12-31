
unit fribidi_flags;
interface

{
  Automatically converted by H2Pas 1.0.0 from fribidi_flags.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fribidi_flags.h
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
PFriBidiFlags  = ^FriBidiFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ FriBidi
 * fribidi-flags.h - option flags
 *
 * Author:
 *   Behdad Esfahbod, 2005
 *
 * Copyright (C) 2005 Behdad Esfahbod
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
{$ifndef _FRIBIDI_FLAGS_H}
{$define _FRIBIDI_FLAGS_H}
{$include "fribidi-common.h"}
{$include "fribidi-types.h"}
{$include "fribidi-begindecls.h"}
type
  PFriBidiFlags = ^TFriBidiFlags;
  TFriBidiFlags = Tuint32_t;
{ 
 * Define option flags that various functions use. Each mask has
 * only one bit set.
  }

const
  FRIBIDI_FLAG_SHAPE_MIRRORING = $00000001;  
  FRIBIDI_FLAG_REORDER_NSM = $00000002;  
  FRIBIDI_FLAG_SHAPE_ARAB_PRES = $00000100;  
  FRIBIDI_FLAG_SHAPE_ARAB_LIGA = $00000200;  
  FRIBIDI_FLAG_SHAPE_ARAB_CONSOLE = $00000400;  
  FRIBIDI_FLAG_REMOVE_BIDI = $00010000;  
  FRIBIDI_FLAG_REMOVE_JOINING = $00020000;  
  FRIBIDI_FLAG_REMOVE_SPECIALS = $00040000;  
{
 * And their combinations.
  }
  FRIBIDI_FLAGS_DEFAULT = (FRIBIDI_FLAG_SHAPE_MIRRORING or FRIBIDI_FLAG_REORDER_NSM) or FRIBIDI_FLAG_REMOVE_SPECIALS;  
  FRIBIDI_FLAGS_ARABIC = FRIBIDI_FLAG_SHAPE_ARAB_PRES or FRIBIDI_FLAG_SHAPE_ARAB_LIGA;  
{$include "fribidi-enddecls.h"}
{$endif}
{ !_FRIBIDI_FLAGS_H  }
{ Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
  }

implementation


end.
