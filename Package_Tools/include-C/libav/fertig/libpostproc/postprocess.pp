
unit postprocess;
interface

{
  Automatically converted by H2Pas 1.0.0 from postprocess.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    postprocess.h
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
Pint8_t  = ^int8_t;
Ppp_context  = ^pp_context;
Ppp_mode  = ^pp_mode;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001-2003 Michael Niedermayer (michaelni@gmx.at)
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef POSTPROC_POSTPROCESS_H}
{$define POSTPROC_POSTPROCESS_H}
{*
 * @file
 * @ingroup lpp
 * external API header
  }
{*
 * @defgroup lpp libpostproc
 * Video postprocessing library.
 *
 * @
  }
{$include "libpostproc/version_major.h"}
{$ifndef HAVE_AV_CONFIG_H}
{ When included as part of the ffmpeg build, only include the major version
 * to avoid unnecessary rebuilds. When included externally, keep including
 * the full version information.  }
{$include "libpostproc/version.h"}
{$endif}
{*
 * Return the LIBPOSTPROC_VERSION_INT constant.
  }

function postproc_version:dword;cdecl;external;
{*
 * Return the libpostproc build-time configuration.
  }
(* Const before type ignored *)
function postproc_configuration:Pchar;cdecl;external;
{*
 * Return the libpostproc license.
  }
(* Const before type ignored *)
function postproc_license:Pchar;cdecl;external;
const
  PP_QUALITY_MAX = 6;  
{$include <inttypes.h>}
type
  Ppp_context = ^Tpp_context;
  Tpp_context = pointer;

  Ppp_mode = ^Tpp_mode;
  Tpp_mode = pointer;
(* Const before type ignored *)
  var
    pp_help : Pchar;cvar;external;
{/< a simple help text }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure pp_postprocess(src:array[0..2] of Puint8_t; srcStride:array[0..2] of longint; dst:array[0..2] of Puint8_t; dstStride:array[0..2] of longint; horizontalSize:longint; 
            verticalSize:longint; QP_store:Pint8_t; QP_stride:longint; mode:Ppp_mode; ppContext:Ppp_context; 
            pict_type:longint);cdecl;external;
{*
 * Return a pp_mode or NULL if an error occurred.
 *
 * @param name    the string after "-pp" on the command line
 * @param quality a number from 0 to PP_QUALITY_MAX
  }
(* Const before type ignored *)
function pp_get_mode_by_name_and_quality(name:Pchar; quality:longint):Ppp_mode;cdecl;external;
procedure pp_free_mode(mode:Ppp_mode);cdecl;external;
function pp_get_context(width:longint; height:longint; flags:longint):Ppp_context;cdecl;external;
procedure pp_free_context(ppContext:Ppp_context);cdecl;external;
const
  PP_CPU_CAPS_MMX = $80000000;  
  PP_CPU_CAPS_MMX2 = $20000000;  
  PP_CPU_CAPS_3DNOW = $40000000;  
  PP_CPU_CAPS_ALTIVEC = $10000000;  
  PP_CPU_CAPS_AUTO = $00080000;  
  PP_FORMAT = $00000008;  
  PP_FORMAT_420 = $00000011 or PP_FORMAT;  
  PP_FORMAT_422 = $00000001 or PP_FORMAT;  
  PP_FORMAT_411 = $00000002 or PP_FORMAT;  
  PP_FORMAT_444 = $00000000 or PP_FORMAT;  
  PP_FORMAT_440 = $00000010 or PP_FORMAT;  
  PP_PICT_TYPE_QP2 = $00000010;  {/< MPEG2 style QScale }
{*
 * @
  }
{$endif}
{ POSTPROC_POSTPROCESS_H  }

implementation


end.
