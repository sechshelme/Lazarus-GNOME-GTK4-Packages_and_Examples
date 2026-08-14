
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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


{ Copyright (c) the JPEG XL Project Authors. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
  }
{* @addtogroup libjxl_common
 * @
 * @file version.h
 * @brief libjxl version information
  }
{$ifndef JXL_VERSION_H_}
{$define JXL_VERSION_H_}

const
  JPEGXL_MAJOR_VERSION = 0;  {/< JPEG XL Major version }
  JPEGXL_MINOR_VERSION = 7;  {/< JPEG XL Minor version }
  JPEGXL_PATCH_VERSION = 0;  {/< JPEG XL Patch version }
{* Can be used to conditionally compile code for a specific JXL version
 * @param[maj] major version
 * @param[min] minor version
 *
 * @code
 * #if JPEGXL_NUMERIC_VERSION < JPEGXL_COMPUTE_NUMERIC_VERSION(0,8,0)
 * // use old/deprecated api
 * #else
 * // use current api
 * #endif
 * @endcode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function JPEGXL_COMPUTE_NUMERIC_VERSION(major,minor,patch : longint) : longint;

{ Numeric representation of the version  }
{ was #define dname def_expr }
function JPEGXL_NUMERIC_VERSION : longint; { return type might be wrong }

{$endif}
{ JXL_VERSION_H_  }
{* @ }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function JPEGXL_COMPUTE_NUMERIC_VERSION(major,minor,patch : longint) : longint;
begin
  JPEGXL_COMPUTE_NUMERIC_VERSION:=(((major shl 24) or (minor shl 16)) or (patch shl 8)) or 0;
end;

{ was #define dname def_expr }
function JPEGXL_NUMERIC_VERSION : longint; { return type might be wrong }
  begin
    JPEGXL_NUMERIC_VERSION:=JPEGXL_COMPUTE_NUMERIC_VERSION(JPEGXL_MAJOR_VERSION,JPEGXL_MINOR_VERSION,JPEGXL_PATCH_VERSION);
  end;


end.
