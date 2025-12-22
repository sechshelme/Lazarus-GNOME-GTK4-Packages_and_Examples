unit version;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Version macros.
 *
 * This file is part of libswresample
 *
 * libswresample is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libswresample is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with libswresample; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef SWRESAMPLE_VERSION_H}
{$define SWRESAMPLE_VERSION_H}
{*
 * @file
 * Libswresample version macros
  }
{$include "libavutil/version.h"}
{$include "version_major.h"}

const
  LIBSWRESAMPLE_VERSION_MINOR = 12;  
  LIBSWRESAMPLE_VERSION_MICRO = 100;  

{ was #define dname def_expr }
function LIBSWRESAMPLE_VERSION_INT : longint; { return type might be wrong }

{ was #define dname def_expr }
function LIBSWRESAMPLE_VERSION : longint; { return type might be wrong }

const
  LIBSWRESAMPLE_BUILD = LIBSWRESAMPLE_VERSION_INT;  
{$endif}
{ SWRESAMPLE_VERSION_H  }

// === Konventiert am: 22-12-25 19:38:10 ===


implementation


{ was #define dname def_expr }
function LIBSWRESAMPLE_VERSION_INT : longint; { return type might be wrong }
  begin
    LIBSWRESAMPLE_VERSION_INT:=AV_VERSION_INT(LIBSWRESAMPLE_VERSION_MAJOR,LIBSWRESAMPLE_VERSION_MINOR,LIBSWRESAMPLE_VERSION_MICRO);
  end;

{ was #define dname def_expr }
function LIBSWRESAMPLE_VERSION : longint; { return type might be wrong }
  begin
    LIBSWRESAMPLE_VERSION:=AV_VERSION(LIBSWRESAMPLE_VERSION_MAJOR,LIBSWRESAMPLE_VERSION_MINOR,LIBSWRESAMPLE_VERSION_MICRO);
  end;


end.
