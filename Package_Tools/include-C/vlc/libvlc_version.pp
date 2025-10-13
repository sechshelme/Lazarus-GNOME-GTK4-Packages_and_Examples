
unit libvlc_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from libvlc_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    libvlc_version.h
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


{****************************************************************************
 * libvlc_version.h
 *****************************************************************************
 * Copyright (C) 2010 Rémi Denis-Courmont
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 **************************************************************************** }
{*
 * \file
 * This file defines version macros for LibVLC.
 * Those macros are primilarly intended for conditional (pre)compilation.
 * To get the run-time LibVLC version, use libvlc_get_version() instead
 * (the run-time version may be more recent than build-time one, thanks to
 * backward binary compatibility).
 *
 * \version This header file is available in LibVLC 1.1.4 and higher.
  }
{$ifndef LIBVLC_VERSION_H}

const
  LIBVLC_VERSION_H = 1;  
{* LibVLC major version number  }
  LIBVLC_VERSION_MAJOR = 3;  
{* LibVLC minor version number  }
  LIBVLC_VERSION_MINOR = 0;  
{* LibVLC revision  }
  LIBVLC_VERSION_REVISION = 20;  
  LIBVLC_VERSION_EXTRA = 0;  
{* Makes a single integer from a LibVLC version numbers  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LIBVLC_VERSION(maj,min,rev,extra : longint) : longint;

{* LibVLC full version as a single integer (for comparison)  }
{ was #define dname def_expr }
function LIBVLC_VERSION_INT : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBVLC_VERSION(maj,min,rev,extra : longint) : longint;
begin
  LIBVLC_VERSION:=(((maj shl 24) or (min shl 16)) or (rev shl 8)) or extra;
end;

{ was #define dname def_expr }
function LIBVLC_VERSION_INT : longint; { return type might be wrong }
  begin
    LIBVLC_VERSION_INT:=LIBVLC_VERSION(LIBVLC_VERSION_MAJOR,LIBVLC_VERSION_MINOR,LIBVLC_VERSION_REVISION,LIBVLC_VERSION_EXTRA);
  end;


end.
